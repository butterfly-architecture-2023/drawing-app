//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import Combine
import Foundation

final class CanvasViewModel {
    
    // MARK: - input & output
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    // MARK: - property
    
    private let input: Input
    private(set) var output: Output
    
    // MARK: - initialize
    
    init() {
        self.input = .init()
        self.output = .init()
        
        transform()
    }
    
    deinit {
        
    }
    
    
}

// MARK: - transform

extension CanvasViewModel {
    private func transform() {
        
    }
}
