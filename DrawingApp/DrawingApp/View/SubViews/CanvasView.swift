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
    
    private(set) var shapeInfoList: [ShapeInfo] = []
    private(set) var drawingInfoList: [DrawingInfo] = []
    private var mode: DrawingButtonType = .rectangle
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectRectangle(_:)))
        self.addGestureRecognizer(tapGesture)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Touch Event
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard self.mode == .drawing else { return }
        let line = DrawingInfo(width: 2.0, color: UIColor.random().without(.red), point: makeTouchPoint(touches))
        drawingInfoList.append(line)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard self.mode == .drawing else { return }
        var context = setContext()
        let currentPoint = makeTouchPoint(touches)
        drawLine(context.point, currentPoint)

        context.point = currentPoint
        
        if let index = drawingInfoList.firstIndex(where: { $0.id == context.id }) {
            drawingInfoList[index] = context
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard self.mode == .drawing else { return }
        let context = setContext()
        let currentPoint = makeTouchPoint(touches)
        drawLine(context.point, currentPoint)
    }
    
    
    // MARK: - Draw CGRect
    
    override func draw(_ rect: CGRect) {
        _ = shapeInfoList.map {
            guard let context = UIGraphicsGetCurrentContext() else { return }
            let color = ($0.isSelected == true) ? UIColor.red : $0.color
            context.setStrokeColor(color.cgColor)
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
    
    private func makeRectangle(_ position: CGPoint, _ color: UIColor, _ isSelected: Bool = false) {
        // 사각형 사이즈
        let width: CGFloat = 100
        let height: CGFloat = 100

        let path = UIBezierPath()
        path.lineWidth = 1.0
        path.move(to: CGPoint(x: position.x, y: position.y))
        path.addLine(to: CGPoint(x: position.x + width, y: position.y))
        path.addLine(to: CGPoint(x: position.x + width, y: position.y + height))
        path.addLine(to: CGPoint(x: position.x, y: position.y+height))
        path.close()
        shapeInfoList.append(ShapeInfo(point: position, path: path, color: color, isSelected: isSelected))
        self.setNeedsDisplay()
    }
    
    @objc private func selectRectangle(_ sender: UITapGestureRecognizer) {
        guard let index = self.shapeInfoList.map({ $0.contains(sender.location(in: sender.view)) }).firstIndex(of: true) else { return }
        let shapeInfo = shapeInfoList[index]
        shapeInfoList.remove(at: index)
        makeRectangle(shapeInfo.point, shapeInfo.color, !shapeInfo.isSelected)
    }
    
    private func printStamp() {
        makeRectangle(CGPoint.random(), UIColor.random().without(.red))
    }
    
    func updateMode(_ type: DrawingButtonType) {
        self.mode = type
        switch type {
            case .rectangle:
                printStamp()
            case .drawing:
                break
        }
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
