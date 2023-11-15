//
//  CanvasView.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/12.
//

import UIKit

final class CanvasView: UIView {
    var interactor: DrawingBusinessLogic?
    
    var isDrawingMode = false
    var shapeLayers = [CAShapeLayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawingMode else { return }
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        interactor?.startDrawLine(drawPoint: location.drawPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawingMode else { return }
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        interactor?.makeDrawingLine(drawPoint: location.drawPoint)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawingMode else { return }
        
        interactor?.endDrawingLine()
    }
    
    func syncDrawing(infos: [DrawingInformation]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            infos.forEach {
                if $0.drawingType == .rectangle {
                    self.appendRectangle(info: $0)
                }
                
                if $0.drawingType == .line {
                    self.makeDrawingLineView(info: $0)
                }
            }
        }
    }
    
    func makeDrawingLineView(info: DrawingInformation) {
        shapeLayers.forEach{ $0.removeFromSuperlayer() }
        guard let path = info.path?.path else { return }
        let rect = path.bounds
        let drawButton = DrawedButton(info: info)
        
        let shapeLayer = makeShapeLayer()
        path.apply(CGAffineTransform(translationX: -rect.origin.x, y: -rect.origin.y))
        shapeLayer.path = path.cgPath
        drawButton.layer.addSublayer(shapeLayer)
        drawButton.frame = rect
        addSubview(drawButton)
    }
    
    func drawDrawing(drawingPath: DrawingInformation) {
        guard let path = drawingPath.path?.path else{ return }
        let shapeLayer = makeShapeLayer()
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        shapeLayers.append(shapeLayer)
    }
    
    func appendRectangle(info: DrawingInformation) {
        let button = DrawedButton(info: info)
        button.addTarget(self, action: #selector(handleShapeTap), for: .touchUpInside)
        addSubview(button)
    }
    
    func makeShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5.0
        return shapeLayer
    }
}

extension CanvasView {
    func deselectSelectedShape(id: String? = nil) {
        _ = getRectangleViews()
            .filter { $0.info.id != id }
            .map { $0.clear() }
    }
    
    func getRectangleViews() -> [DrawedButton] {
        return subviews
            .compactMap { $0 as? DrawedButton }
    }
}

private extension CanvasView {
    @objc func handleShapeTap(_ sender: DrawedButton) {
        sender.active()
        deselectSelectedShape(id: sender.info.id)
    }
    
    func basicSetUI() {
        backgroundColor = .white
    }
}
