//
//  DrawingViewModel.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/04.
//

import Combine
import Foundation

class DrawingViewModel {
    @Published private(set) var components: [Drawable] = []
    @Published private(set) var oldSelectedComponent: Drawable?
    @Published private(set) var selectedComponent: Drawable?
    
    private let squareFactory: SquareFactory

    var cancellables: Set<AnyCancellable> = []

    init(squareFactory: SquareFactory) {
        self.squareFactory = squareFactory
    }
    
    func tappedSquareButton(with canvas: CGRect?) {
        guard let canvas = canvas else { return }
        if let square = squareFactory.makeSquare(in: canvas) {
            components.append(square)
        }
    }
    
    func tappedCanvas(with point: CGPoint) {
        if let selected = squareFactory.filteredClick(touchPoint: point, squares: components.compactMap({ $0 as? Square })) {
            self.oldSelectedComponent = selectedComponent
            self.selectedComponent = selected
        }
    }
    
    func tappedDrawingButton() {
        
    }
}
