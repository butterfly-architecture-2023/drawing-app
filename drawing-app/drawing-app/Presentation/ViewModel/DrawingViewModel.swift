//
//  DrawingViewModel.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/04.
//

import Combine
import Foundation

class DrawingViewModel {
    private let squareFactory: SquareFactory
    @Published private(set) var components: [Drawable] = []
    @Published private(set) var selectedComponents: Drawable?
    
    var cancellables: Set<AnyCancellable> = []

    init(squareFactory: SquareFactory) {
        self.squareFactory = squareFactory
    }
    
    func tappedSquareButton(with canvas: CGRect?) {
        guard let canvas = canvas else { return }
        if let square = squareFactory.makeComponent(in: canvas) {
            components.append(square)
        }
    }
    
    func tappedCanvas(with point: CGPoint) {
        let selected = squareFactory.filteredClick(touchPoint: point, squares: components.compactMap({ $0 as? Square }))
        self.selectedComponents = selected
    }
    
    func tappedDrawingButton() {
        
    }
}
