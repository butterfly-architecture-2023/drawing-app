//
//  ViewController.swift
//  drawing-app
//
//  Created by 윤소희 on 2023/11/09.
//

import UIKit

class ViewController: UIViewController {
    var currentMode: DrawingMode = .none
    
    var rectangles: [Rectangle] = []
    var layers: [UUID: CAShapeLayer] = [:]
    
    enum DrawingMode {
        case none
        case drawing
        case rectangle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

