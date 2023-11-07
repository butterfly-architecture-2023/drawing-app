//
//  CanvasViewModel.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/07.
//

import Foundation
import RxSwift
import RxCocoa

protocol CanvasViewModelInput {
    var canvasSize: PublishRelay<CGRect> { get }
    var didTapMakeSquareButton: PublishRelay<Void> { get }
}

protocol CanvasViewModelOutput {
    var showSquare: PublishRelay<Square> { get }
}

protocol CanvasViewModelProtocol: CanvasViewModelInput, CanvasViewModelOutput {
    var input: CanvasViewModelInput { get }
    var output: CanvasViewModelOutput { get }
}

final class CanvasViewModel: CanvasViewModelProtocol {
    
    // MARK: - Essential
    
    var input: CanvasViewModelInput { self }
    var output: CanvasViewModelOutput { self }
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var xRange: ClosedRange<CGFloat>?
    private var yRange: ClosedRange<CGFloat>?
    
    // MARK: - Input
    
    let canvasSize = PublishRelay<CGRect>()
    let didTapMakeSquareButton = PublishRelay<Void>()

    
    // MARK: - Output
    
    let showSquare = PublishRelay<Square>()
    
    // MARK: - Initialize
    
    init() {
        rxBind()
    }
    
    // MARK: - RxBind
    
    private func rxBind() {
        input.canvasSize
            .bind(with: self, onNext: { owner, canvas in
                let squareSize = 100.0
                owner.xRange = canvas.minX...canvas.maxX - squareSize
                owner.yRange = canvas.minY...canvas.maxY - squareSize
            })
            .disposed(by: disposeBag)
        
        input.didTapMakeSquareButton
            .bind(with: self, onNext: { owner, _ in
                guard let square = owner.makeSquare() else { return }
                owner.output.showSquare.accept(square)
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Function
    
    private func makeSquare() -> Square? {
        guard let xRange,
              let yRange else { return nil }
        
        return .init(point: .init(x: .random(in: xRange), y: .random(in: yRange)), color: .random)
    }

}
