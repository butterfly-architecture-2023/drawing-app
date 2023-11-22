//
//  CanvasView.swift
//  DrawingApp
//
//  Created by elly on 11/20/23.
//

import UIKit

class CanvasView: UIView {
    
    // MARK: - UI Items
    
    var shapeCanvas: ShapeCanvas = ShapeCanvas()
    var drawingCanvas: DrawingCanvas = DrawingCanvas()
    
    private var drawingInfo: Drawing = Drawing()
    
    
    // MARK: - Delegate
    
    var delegate: EventDelegate?
    
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
        drawingInfo = Drawing(color: CGColor.random(without: .red), points: [drawingCanvas.makeTouchPoint(touches)])
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lastPoint = drawingInfo.points.last ?? CGPoint()
        let currentPoint = drawingCanvas.makeTouchPoint(touches)
        drawingCanvas.drawLine(lastPoint, currentPoint, drawingInfo.color)
        drawingInfo.points.append(currentPoint)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lastPoint = drawingInfo.points.last ?? CGPoint()
        let currentPoint = drawingCanvas.makeTouchPoint(touches)
        drawingCanvas.drawLine(lastPoint, currentPoint, drawingInfo.color)
        drawingInfo.points.append(currentPoint)
        let position = DrawingPosition(points: drawingInfo.points)
        delegate?.send(position)
    }
}

extension CanvasView: UISubviewStyle {
    func addSubviews() {
//        self.addSubview(drawingCanvas)
        self.addSubview(shapeCanvas)
        self.addSubview(drawingCanvas)
    }
    
    func makeConstraints() {
        shapeCanvas.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        drawingCanvas.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
