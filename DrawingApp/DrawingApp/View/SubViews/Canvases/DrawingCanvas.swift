//
//  DrawingCanvas.swift
//  DrawingApp
//
//  Created by elly on 11/16/23.
//

import UIKit

class DrawingCanvas: UIImageView {
    // MARK: - Properties
    
    private var drawingInfo: Drawing = Drawing()
    
    var graphicsInfo: [Drawing] = [] {
        didSet {
            draw()
        }
    }
    
    
    // MARK: - Delegate
    
    var delegate: EventDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    convenience init(graphicsInfo: [Drawing] = []) {
        self.init(frame: .zero)
        self.graphicsInfo = graphicsInfo
        self.backgroundColor = .white
        self.alpha = 0.5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Draw CGRect
    
    func makeTouchPoint(_ touches: Set<UITouch>) -> CGPoint {
        let touch = touches.first! as UITouch
        let point = touch.location(in: self)
        return point
    }
    
    private func setContext() {
        UIGraphicsBeginImageContext(self.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(drawingInfo.color)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(2)
    }
    
    func drawLine(_ lastPoint: CGPoint, _ currentPoint: CGPoint, _ color: CGColor) {
        UIGraphicsBeginImageContext(self.frame.size)
        self.image?.draw(in: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(color)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(2.0)
        context?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        context?.strokePath()
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

    }
    
    func draw() {
        print("DrawingCanvas draw")
        print(graphicsInfo)
        for drawing in graphicsInfo {
            for index in 0..<drawing.points.count-1 {
                drawLine(drawing.points[index], drawing.points[index+1], drawing.color)
            }
        }
        setNeedsDisplay()
    }
}
