//
//  CanvasViewController.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import OSLog
import UIKit

final class CanvasViewController: UIViewController {
    
    // MARK: - property
    
    private let logger: Logger = .init(subsystem: AppConfig.BuildSetting.appBundleIdentifier,
                                       category: "CanvasViewController")
    private let viewModel: CanvasViewModel
    
    // MARK: - ui component property
    
    private let toolbarView: ToolbarView = .init()
    
    // MARK: - life cycle
    
    init(viewModel: CanvasViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    deinit {
        logger.debug("deinitialize")
    }
}

// MARK: - set up UI

extension CanvasViewController {
    private func setUpUI() {
        setUpView()
        setUpLayout()
        setUpComponents()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
    }
    
    private func setUpLayout() {
        view.addSubview(toolbarView)
        toolbarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toolbarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func setUpComponents() {
        setUpToolbarView()
    }
    
    private func setUpToolbarView() {
        toolbarView.delegate = self
    }
}

// MARK: - ToolbarViewDelegate

extension CanvasViewController: ToolbarViewDelegate {
    func onTapRectangleItemButton() {
        logger.info("tapped rectangle button")
    }
    
    func onTapDrawingItemButton() {
        logger.info("tapped drawing button")
    }
}
