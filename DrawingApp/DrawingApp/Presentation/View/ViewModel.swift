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
        let createdSquare = PublishRelay<Square>()
        let squareViewSelectedState = PublishRelay<Bool>()
        let changedState = PublishRelay<(currentColor: ColorType?, currentCoordinates: [CGPoint])>()
        let currentColor = BehaviorRelay<ColorType?>(value: nil)
        let currentCoordinates = BehaviorRelay<[CGPoint]>(value: [])
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
                output.createdSquare.accept(square)
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

                let color = output.currentColor.value
                let coordinates = output.currentCoordinates.value

                switch gestureState {
                case .began:
                    drawingUseCase.startDrawing(at: location)

                case .changed:
                    drawingUseCase.continueDrawing(to: location)

                    if output.currentCoordinates.value.count >= 2 {
                        output.changedState.accept((color, coordinates))
                    }

                case .ended:
                    drawingUseCase.endDrawing(
                        color: color,
                        coordinates: coordinates
                    )
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

        drawingUseCase.readCurrentColor()
            .asDriver()
            .drive(output.currentColor)
            .disposed(by: disposeBag)

        drawingUseCase.readCurrentCoordinates()
            .asDriver()
            .drive(output.currentCoordinates)
            .disposed(by: disposeBag)

        return output
    }
}
