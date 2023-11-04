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
    
    private var contextList: [Context] = []
    
    
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
        let line = Context(width: 2.0, color: .black, point: makeTouchPoint(touches))
        contextList.append(line)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var context = setContext()
        let currentPoint = makeTouchPoint(touches)
        drawLine(context.point, currentPoint)

        context.point = currentPoint
        
        if let index = contextList.firstIndex(where: { $0.id == context.id }) {
            contextList[index] = context
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let context = setContext()
        let currentPoint = makeTouchPoint(touches)
        drawLine(context.point, currentPoint)
    }
    
    private func makeTouchPoint(_ touches: Set<UITouch>) -> CGPoint {
        let touch = touches.first! as UITouch
        let point = touch.location(in: canvasImageView)
        return point
    }
    
    private func setContext() -> Context {
        guard let line = contextList.last else { return Context() }
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
    
    func removeAllContext() {
        contextList.removeAll()
        canvasImageView.image = nil
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
