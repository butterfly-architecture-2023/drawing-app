//
//  ViewController.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    
    private let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rectangleButtonTapped(_ sender: Any) {
        let rectangle = Rectangle(rect: rectangleRandomCGRect(), backgroundColor: .random())
        canvas.add(rectangle: rectangle)
        canvas.shapes.forEach { rectangle in
            canvasView.add(rectangle: rectangle)
        }
    }
    
    func rectangleRandomCGRect() -> CGRect {
        let size = CGSize(width: 100.0, height: 100.0)
        
        let maxWidth = UIScreen.main.bounds.width - size.width
        let maxHeight = UIScreen.main.bounds.height - size.height

        let origin = CGPoint(x: CGFloat.random(in: 0...maxWidth),
                             y: CGFloat.random(in: 0...maxHeight))
        
        return CGRect(origin: origin, size: size)
    }
}

