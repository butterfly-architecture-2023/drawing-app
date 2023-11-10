//
//  BaseViewController.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

class BaseViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setConfiguration()
    }

    func setViews() { }
    func setConstraints() { }
    func setConfiguration() {
        self.view.backgroundColor = .white
    }
}
