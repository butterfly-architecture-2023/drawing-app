//
//  ViewModel.swift
//  DrawingApp
//
//  Created by 강호성 on 11/7/23.
//

import Foundation

import RxCocoa
import RxSwift

final class ViewModel {

    struct Input {
        let createSquareButtonDidTap: Signal<Position>
        let createDrawingButtonDidTap: Signal<Void>
        let drawingViewPanGesture: Signal<(location: CGPoint, gesture: GestureState)>
        let squareViewDidTap: Signal<Int>
    }
    struct Output {
        let square = PublishRelay<Square>()
        let changedState = PublishRelay<(currentColor: ColorType, currentCoordinates: [CGPoint])>()
        let squareViewSelectedState = PublishRelay<Bool>()
    }
    var disposeBag = DisposeBag()

    private var selectedButtonType: ButtonType?

    private let squareManagementUseCase: SquareManagementUseCase
    private let squareSelectionUseCase: SquareSelectionUseCase
    private let drawingUseCase: DrawingUseCase

    init(
        squareManagementUseCase: SquareManagementUseCase,
        squareSelectionUseCase: SquareSelectionUseCase,
        drawingUseCase: DrawingUseCase
    ) {
        self.squareManagementUseCase = squareManagementUseCase
        self.squareSelectionUseCase = squareSelectionUseCase
        self.drawingUseCase = drawingUseCase
    }

    func transform(input: Input) -> Output {
        let output = Output()

        input.createSquareButtonDidTap
            .asSignal()
            .emit(onNext: { [weak self] maxPosition in
                guard let self = self else { return }
                self.selectedButtonType = .square

                let square = squareManagementUseCase.createSquare(within: maxPosition)
                output.square.accept(square)
            })
            .disposed(by: disposeBag)

        input.createDrawingButtonDidTap
            .asSignal()
            .emit(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.selectedButtonType = .drawing
            })
            .disposed(by: disposeBag)

        input.drawingViewPanGesture
            .asSignal()
            .emit(onNext: { [weak self] location, gestureState in
                guard let self = self,
                      selectedButtonType == .drawing
                else { return }

                switch gestureState {
                case .began:
                    drawingUseCase.startDrawing(at: location)

                case .changed:
                    drawingUseCase.continueDrawing(to: location)

                    let currentCoordinates = drawingUseCase.readCurrentCoordinates()
                    guard let currentColor = drawingUseCase.readCurrentColor(),
                          currentCoordinates.count >= 2
                    else { return }

                    output.changedState.accept((currentColor, currentCoordinates))

                case .ended:
                    drawingUseCase.endDrawing()
                }
            })
            .disposed(by: disposeBag)

        input.squareViewDidTap
            .asSignal()
            .emit(onNext: { [weak self] id in
                guard let self = self,
                      self.selectedButtonType == .square,
                      var square = squareManagementUseCase.readSquare(id: id)
                else { return }

                if square.isSelected {
                    squareSelectionUseCase.deselectSquare(&square)
                } else {
                    squareSelectionUseCase.selectSquare(&square)
                }

                squareManagementUseCase.updateSquare(square)
                output.squareViewSelectedState.accept(square.isSelected)
            })
            .disposed(by: disposeBag)

        return output
    }
}
