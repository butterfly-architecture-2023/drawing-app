//
//  ViewController.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/04.
//

import UIKit

class DrawingViewController: UIViewController {

    private let viewModel: DrawingViewModel
    
    init(viewModel: DrawingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = UIColor.white
    }
    
}
