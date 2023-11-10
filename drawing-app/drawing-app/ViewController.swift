//
//  ViewController.swift
//  drawing-app
//
//  Created by 윤소희 on 2023/11/09.
//

import UIKit

class ViewController: UIViewController {
    var currentMode: DrawingMode = .none
    
    var rectangles: [Rectangle] = []
    var layers: [UUID: CAShapeLayer] = [:]
    
    var currentDrawing: Drawing?
    var drawings: [Drawing] = []
    
    enum DrawingMode {
        case none
        case drawing
        case rectangle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onBtnRectangle(_ sender: UIButton) {
        currentMode = .rectangle
        
        let color = UIColor.randomSystemColor()
        let x = CGFloat.random(in: 0...(view.bounds.width - 100))
        let y = CGFloat.random(in: 0...(view.bounds.height - 150))
        let newRectangle = Rectangle(x: x, y: y, color: color)
        
        rectangles.append(newRectangle)
        addRectangleLayer(newRectangle)
    }
    
    
    private func addRectangleLayer(_ rectangle: Rectangle) {
   
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(rect: rectangle.frame).cgPath
        shapeLayer.fillColor = rectangle.color.cgColor
        
        if rectangle.isSelected {
            shapeLayer.strokeColor = UIColor.systemRed.cgColor
            shapeLayer.lineWidth = 5
        } else {
            shapeLayer.strokeColor = UIColor.clear.cgColor
        }
        
        view.layer.addSublayer(shapeLayer)
        layers[rectangle.id] = shapeLayer
    }
    
    private func updateLayer(rectangle: Rectangle) {
        guard let layer = layers[rectangle.id] else { return }
        layer.strokeColor = rectangle.isSelected ? UIColor.systemRed.cgColor : UIColor.clear.cgColor
    }
    
    private func updateLayers() {
        for rectangle in rectangles {
            updateLayer(rectangle: rectangle)
        }
    }
    
    
    @IBAction func onBtnDrawing(_ sender: UIButton) {
        currentMode = .drawing
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: view)
            
            switch currentMode {
            case .none: break
                
            case .drawing:
                let newPath = UIBezierPath()
                newPath.move(to: location)
                let color = UIColor.randomSystemColor()
                // 현재 드로잉 객체 생성
                currentDrawing = Drawing(path: newPath, color: color, lineWidth: 2.0)
                
            case .rectangle:
                // 선택 상태를 재설정. 기존에 선택된 사각형 해제
                for index in rectangles.indices {
                    rectangles[index].isSelected = false
                }
                updateLayers()
                
                for (index, rectangle) in rectangles.enumerated().reversed() {
                    if rectangle.frame.contains(location) {
                        // 현재 터치된 사각형을 선택
                        rectangles[index].isSelected = true
                        updateLayer(rectangle: rectangles[index])
                        break
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let currentDrawing = currentDrawing else { return }
        let touchLocation = touch.location(in: view)
        
        // 현재 경로에 터치 포인트 추가
        currentDrawing.path.addLine(to: touchLocation)
        self.currentDrawing = currentDrawing
        
        //화면 다시
        drawCurrentDrawing()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let currentDrawing = currentDrawing {
            // 드로잉을 배열에 추가
            drawings.append(currentDrawing)
            self.currentDrawing = nil
        }
    }
    
    func drawCurrentDrawing() {
        guard let currentDrawing = currentDrawing else { return }
        
        // 드로잉 레이어 생성
        let drawingLayer = CAShapeLayer()
        drawingLayer.path = currentDrawing.path.cgPath
        drawingLayer.strokeColor = currentDrawing.color.cgColor
        drawingLayer.fillColor = nil
        drawingLayer.lineWidth = currentDrawing.lineWidth
        
        view.layer.addSublayer(drawingLayer)
        //뷰의 컨텐츠가 변결될때 뷰를 다시 그려야함을 시스템에 알림
        view.setNeedsDisplay()
    }
    
}

