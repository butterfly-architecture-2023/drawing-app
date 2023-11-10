//
//  CanvasView.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import UIKit

protocol CanvasViewDelegate: AnyObject {
    func onTapRectangleView(_ view: RectangleView, rectangle: Rectangle)
}

final class CanvasView: UIView {
    
    // MARK: - property
    
    // INTERNAL
    weak var delegate: CanvasViewDelegate?
    
    private var path = UIBezierPath()
    private var lines: [UIBezierPath] = []
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        path.lineWidth = 15
        path.lineCapStyle = .round
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
    }
    
    override func draw(_ rect: CGRect) {
        for line in lines {
            line.stroke()
        }
    }
}

// MARK: - internal method

extension CanvasView {
    func append(rectangle: Rectangle) {
        let rectangleView = RectangleView(frame: rectangle.rect)
        rectangleView.bind(with: rectangle)
        rectangleView.delegate = self
        
        addSubview(rectangleView)
    }
}

// MARK: - action

extension CanvasView {
    @objc
    private func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: self)
        
        switch recognizer.state {
        case .began:
            path = UIBezierPath()
            path.lineWidth = 15
            path.lineCapStyle = .round
            path.move(to: point)
            lines.append(path)
            
        case .changed, .ended:
            path.addLine(to: point)
            setNeedsDisplay()
        default:
            break
        }
    }
}

// MARK: - set up UI

extension CanvasView {
    private func setUpUI() {
        setUpView()
        setUpLayout()
        setUpComponents()
    }
    
    private func setUpView() {
        backgroundColor = .white
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(panGesture)
    }
    
    private func setUpLayout() {
        
    }
    
    private func setUpComponents() {
        
    }
}

// MARK: - RectangleViewDelegate

extension CanvasView: RectangleViewDelegate {
    func onTapRectangleView(_ view: RectangleView, rectangle: Rectangle) {
        delegate?.onTapRectangleView(view, rectangle: rectangle)
    }
}
