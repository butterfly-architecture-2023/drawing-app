//
//  ViewController.swift
//  DrawingApp
//
//  Created by leeyeon2 on 11/4/23.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    //    lazy var drawingView = UIImageView()
    lazy var drawingView = UIView()
    private var drawingManager = DrawingManager()
    var tagNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUI()
    }
    
    // MARK: - Gesture Action
    /// 사각형 선택
    /// - Parameter sender: sender
    @objc func selectShape(_ sender: GenreTapGestureRecognizer) {
        if let square = sender.square,
           let view = self.view.hitTest(sender.location(in: self.view), with: nil){
            square.isSelected = drawingManager.isSelectedSquare(selectedView: view,
                                                                selected: square.isSelected)
        }
    }
    
    /// 사각형 생성
    /// - Parameter sender:
    @objc func drawSquare(_ sender: UITapGestureRecognizer) {
        let randomPosition = Position(x: CGFloat.random(in: 0...width-100) ,
                                      y: CGFloat.random(in: 0...height-220))
        let square = Square()
        square.x = randomPosition.x
        square.y = randomPosition.y
        square.id = tagNumber
        tagNumber += 1
        let squareView = drawingManager.drawShape(shape: square)
        view.addSubview(squareView)
        
        let tap = GenreTapGestureRecognizer(target: self, action: #selector(self.selectShape(_:)))
        tap.delegate = self
        tap.square = square
        squareView.addGestureRecognizer(tap)
    }
    
    /// 드로잉 그리기 버튼 클릭
    @objc func drawDrawing() {
        let subView = Canvas(frame: CGRect(x: 100,
                                           y: 100,
                                           width: 300,
                                           height: 300))
        subView.backgroundColor = .black
        //        subView.layer.opacity = 0.3
        drawingView.addSubview(subView)
    }
    
    /// UI 세팅
    func settingUI() {
        //기본 화면
        let drawingView = Canvas()
        
        view.addSubview(drawingView)
        drawingView.translatesAutoresizingMaskIntoConstraints = false
        drawingView.backgroundColor = .white
        
        NSLayoutConstraint.activate(
            [
                drawingView.topAnchor.constraint(equalTo: self.view.topAnchor),
                drawingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                drawingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                drawingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
        
        // 버튼 추가
        let buttonStackView = makeButton()
        drawingView.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        buttonStackView.centerXAnchor.constraint(equalTo: drawingView.centerXAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: drawingView.bottomAnchor).isActive = true
        NSLayoutConstraint.activate(
            [
                buttonStackView.widthAnchor.constraint(equalToConstant: 200),
                buttonStackView.heightAnchor.constraint(equalToConstant: 120)
            ])
    }
    
    /// 메뉴 버튼 생성
    /// - Returns: 생성된 버튼 stack view
    func makeButton() -> UIStackView {
        let menu = ButtonStackView()
        
        let squareBtn = SquareButton()
        let squareBtnTap = UITapGestureRecognizer(target: self, action: #selector(self.drawSquare))
        menu.createButton(shape: squareBtn, gesture: squareBtnTap)
        
        let drawBtn = DrawButton()
        let drawBtntap = UITapGestureRecognizer(target: self, action: #selector(self.drawDrawing))
        menu.createButton(shape: drawBtn, gesture: drawBtntap)
        return menu.buttonStackView()
    }
}

/// square 받기 위해 UITapGestureRecognizer 상속 받는 클래스 custom
class GenreTapGestureRecognizer: UITapGestureRecognizer {
    var square: Square?
}

class Canvas: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.randomColor.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    }
    
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }
        
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
}
