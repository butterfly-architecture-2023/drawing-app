//
//  CanvasViewController.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var drawingButton: UIButton!
    
    private let viewModel = CanvasViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPanGesture()
    }
    
    static func create() -> UIViewController {
        let viewController = UIStoryboard.viewController(CanvasViewController.self)
        return viewController
    }
    
    func setupPanGesture() {
        let panGesture: UIPanGestureRecognizer
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanned(_:)))
        canvasView.addGestureRecognizer(panGesture)
    }
    
    @IBAction func rectangleButtonTapped(_ sender: Any) {
        let screenBounds = UIScreen.main.bounds
        
        let rectangle = viewModel.drawRectangle(maxX: screenBounds.width - 100,
                                maxY: screenBounds.height - 100)
        
        canvasView.draw(rectangle: rectangle, delegate: self)
    }
    
    @IBAction func drawingButtonTapped(_ sender: UIButton) {
           sender.isSelected = !sender.isSelected
    }
    
    @objc func didPanned(_ gesture: UIPanGestureRecognizer) {
        guard drawingButton.isSelected else { return }

        let location = gesture.location(in: view)

        switch gesture.state {
        case .began:
            viewModel.startDrawing(from: location)

        case .changed:
            viewModel.updateDrawing(to: location)
            canvasView.draw(line: viewModel.drawLine())
            
        case .ended:
            viewModel.endDrawing()

        default:
            break
        }
    }
}

extension CanvasViewController: RectangleViewDelegate {
    func select(rectangleView: RectangleView) {
        if let id = rectangleView.id {
            _ = viewModel.selectRectangle(id: id)
        }
    }
    
    func deselect(rectangleView: RectangleView) {
        if let id = rectangleView.id {
            _ = viewModel.deselectRectangle(id: id)
        }
    }
}
