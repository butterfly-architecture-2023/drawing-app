//
//  CanvasView.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import UIKit

class CanvasView: UIView {
    
    // MARK: - UI Items
    
    private var canvasImageView: UIImageView = UIImageView()
    
    
    // MARK: - Properties
    
    private var shapeInfoList: [ShapeInfo] = []
    private var drawingInfoList: [DrawingInfo] = []
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Touch Event
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let line = DrawingInfo(width: 2.0, color: .black, point: makeTouchPoint(touches))
        drawingInfoList.append(line)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var context = setContext()
        let currentPoint = makeTouchPoint(touches)
        drawLine(context.point, currentPoint)

        context.point = currentPoint
        
        if let index = drawingInfoList.firstIndex(where: { $0.id == context.id }) {
            drawingInfoList[index] = context
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let context = setContext()
        let currentPoint = makeTouchPoint(touches)
        drawLine(context.point, currentPoint)
    }
    
    
    // MARK: - Draw CGRect
    
    override func draw(_ rect: CGRect) {
        _ = shapeInfoList.map {
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setStrokeColor($0.color.cgColor)
            context.addPath($0.path.cgPath)
            context.strokePath()
            UIGraphicsEndImageContext()
        }
    }
    
    private func makeTouchPoint(_ touches: Set<UITouch>) -> CGPoint {
        let touch = touches.first! as UITouch
        let point = touch.location(in: canvasImageView)
        return point
    }
    
    private func setContext() -> DrawingInfo {
        guard let line = drawingInfoList.last else { return DrawingInfo() }
        UIGraphicsBeginImageContext(canvasImageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(line.color.cgColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(line.width)
        return line
    }
    
    private func drawLine(_ lastPoint: CGPoint, _ currentPoint: CGPoint) {
        canvasImageView.image?.draw(in: CGRect(x: 0, y: 0, width: canvasImageView.frame.size.width, height: canvasImageView.frame.size.height))

        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x:currentPoint.x, y:currentPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        canvasImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    private func makeRectangle() {
        // 사각형 사이즈
        let width = 100
        let height = 100
        
        // 랜덤 위치
        let bounds = UIScreen.main.bounds
        let randomX = Int.random(in: 0...(Int(bounds.width))-width - 16)
        let randomY = Int.random(in: 0...(Int(bounds.height))-height - 200)
        print(randomX, randomY)

        let path = UIBezierPath()
        UIColor.systemBlue.set()
        path.lineWidth = 1.0
        path.move(to: CGPoint(x: randomX, y: randomY))
        path.addLine(to: CGPoint(x: randomX+width, y: randomY))
        path.addLine(to: CGPoint(x: randomX+width, y: randomY+height))
        path.addLine(to: CGPoint(x: randomX, y: randomY+height))
        path.close()
        
        shapeInfoList.append(ShapeInfo(path: path, color: makeRandomColor()))
        self.setNeedsDisplay()
    }
    
    private func makeRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...255) / 255.0
        let green = CGFloat.random(in: 0...255) / 255.0
        let blue = CGFloat.random(in: 0...255) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
    func removeAllContext() {
        drawingInfoList.removeAll()
        canvasImageView.image = nil
    }
    
    func printStamp() {
        makeRectangle()
    }
}


// MARK: - UI

extension CanvasView: UISubviewStyle {
    func addSubviews() {
        self.addSubview(canvasImageView)
    }
    
    func makeConstraints() {
        canvasImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
