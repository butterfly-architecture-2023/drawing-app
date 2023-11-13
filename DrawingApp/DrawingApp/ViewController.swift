//
//  ViewController.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var drawingButton: UIButton!
    
    private let canvas = Canvas()
    var points: [CGPoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPanGesture()
    }
    
    @IBAction func rectangleButtonTapped(_ sender: Any) {
        let rectangle = Rectangle(rect: rectangleRandomCGRect(), backgroundColor: .random())
        canvas.add(rectangle: rectangle)
        canvas.shapes.forEach { rectangle in
            canvasView.add(rectangle: rectangle)
        }
    }
    
    @IBAction func drawingButtonTapped(_ sender: UIButton) {
           sender.isSelected = !sender.isSelected
    }

    func setupPanGesture() {
        let panGesture: UIPanGestureRecognizer
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanned(_:)))
        canvasView.addGestureRecognizer(panGesture)
    }
        
    @objc func didPanned(_ gesture: UIPanGestureRecognizer) {
        guard drawingButton.isSelected else { return }

        let location = gesture.location(in: view)

        switch gesture.state {
        case .began:
            // 새로운 드로잉 시작
            points = [location]

        case .changed:
            // 드로잉에 점 추가
            points.append(location)
            drawCurrentLine()
            
        case .ended:
            // 드로잉 완료 및 배열에 추가
            let currentDrawing = Drawing(points: points, lineWidth: 5.0)
            canvas.add(drawing: currentDrawing)

        default:
            break
        }
    }
    
    func drawCurrentLine() {
        guard let firstPoint = points.first else { return }
        let bezierPath = UIBezierPath()
        bezierPath.move(to: firstPoint)

        for point in points.dropFirst() {
            bezierPath.addLine(to: point)
        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    func rectangleRandomCGRect() -> CGRect {
        let size = CGSize(width: 100.0, height: 100.0)
        
        let maxWidth = UIScreen.main.bounds.width - size.width
        let maxHeight = UIScreen.main.bounds.height - size.height

        let origin = CGPoint(x: CGFloat.random(in: 0...maxWidth),
                             y: CGFloat.random(in: 0...maxHeight))
        
        return CGRect(origin: origin, size: size)
    }
}

