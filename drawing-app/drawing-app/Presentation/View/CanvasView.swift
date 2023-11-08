//
//  CanvasView.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/08.
//

import UIKit

class CanvasView: UIView {
    
    private var touchesBegan: ((CGPoint) -> ())
    private var touchesMoved: ((CGPoint) -> ())
    private var touchesEnded: (() -> ())

    init(
        touchesBegan: @escaping ((CGPoint) -> ()),
        touchesMoved: @escaping ((CGPoint) -> ()),
        touchesEnded: @escaping (() -> ())
    ) {
        self.touchesBegan = touchesBegan
        self.touchesMoved = touchesMoved
        self.touchesEnded = touchesEnded
        super.init(frame: .zero)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            touchesBegan(point)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            touchesMoved(point)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded()
    }
    
    func draw(_ shape: CAShapeLayer) {
        layer.addSublayer(shape)
    }
    
    func drawStroke(_ strokeLayer: CAShapeLayer, above shape: CAShapeLayer) {
        layer.insertSublayer(strokeLayer, above: shape)
    }
    
    func removeStroke(_ strokeLayer: CAShapeLayer) {
        layer.sublayers?.first(where: { $0 == strokeLayer })?.removeFromSuperlayer()
    }
    
    private func configUI() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
