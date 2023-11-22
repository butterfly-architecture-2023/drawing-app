//
//  ShapeCanvas.swift
//  DrawingApp
//
//  Created by elly on 11/16/23.
//

import UIKit

class ShapeCanvas: UIView {
    
    // MARK: - Properties
    
    var graphicsInfo: [Rectangle] = [] {
        didSet {
            draw()
        }
    }
    
    
    // MARK: - Delegate
    
    var delegate: EventDelegate?
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectRectangle(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    convenience init(graphicsInfo: [Rectangle] = []) {
        self.init(frame: .zero)
        self.graphicsInfo = graphicsInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Draw CGRect
    
    // shapeInfoList에 있는 사각형을 모두 그려줌
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        _ = graphicsInfo.map {
            guard let context = UIGraphicsGetCurrentContext() else { return }
            let color = ($0.isSelected == true) ? CGColor.red : $0.color
            context.setStrokeColor(color)
            context.addPath(makePath($0.topLeftPoint()).cgPath)
            context.strokePath()
        }
        UIGraphicsEndImageContext()
    }
    
    func makePath(_ position: CGPoint) -> UIBezierPath {
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
        
        return path
    }
    
    // 현재 뷰를 탭 했을 때 해당 위치에서 가까운 사각형을 찾아서 지우고 빨간색으로 다시 그림
    @objc private func selectRectangle(_ sender: UITapGestureRecognizer) {
        
        let position = sender.location(in: sender.view)
        // VM으로 position 전달
        
        self.setNeedsDisplay()
    }
    
    func draw() {
        self.setNeedsDisplay()
    }
}
