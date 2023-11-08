//
//  DrawingViewModel.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/04.
//

import Combine
import Foundation

class DrawingViewModel {
    enum CurrentDrawing {
        case square
        case line
    }
    
    @Published private(set) var components: [Drawable] = []
    @Published private(set) var oldSelectedComponent: Drawable?
    @Published private(set) var selectedComponent: Drawable?
    
    // Line을 따로 두지 않는 방법으로 수정 고민 필요
    @Published private(set) var currentLine: Line?
    
    private var currentDrawing: CurrentDrawing?
    private let squareFactory: SquareFactory
    private let lineFactory: LineFactory

    var cancellables: Set<AnyCancellable> = []

    init(squareFactory: SquareFactory, lineFactory: LineFactory) {
        self.squareFactory = squareFactory
        self.lineFactory = lineFactory
    }
    
    func tappedSquareButton(with canvas: CGRect?) {
        updateCurrentDrawing(by: .square)
        guard let canvas = canvas else { return }
        if let square = squareFactory.makeSquare(in: canvas) {
            components.append(square)
        }
    }
    
    func tappedLineButton() {
        updateCurrentDrawing(by: .line)
    }
    
    func tappedCanvas(with point: CGPoint) {
        guard let currentDrawing = currentDrawing else { return }
        switch currentDrawing {
        case .square:
            if let selected = squareFactory.filteredClick(touchPoint: point, squares: components.compactMap({ $0 as? Square })) {
                self.oldSelectedComponent = selectedComponent
                self.selectedComponent = selected
            }
        case .line:
            if let line = lineFactory.startDraw(in: point) {
                self.currentLine = line
            }
        }
    }
    
    func movedCanvas(with point: CGPoint) {
        self.currentLine?.stack(point)
        self.currentLine = self.currentLine
    }
    
    func touchesEnded() {
        if let line = currentLine {
            components.append(line)
            self.currentLine = nil
        }
    }
    
    private func updateCurrentDrawing(by type: CurrentDrawing) {
        self.currentDrawing = type
    }
}
