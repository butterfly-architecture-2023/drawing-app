//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import Combine
import Foundation

final class CanvasViewModel: ObservableObject {
  enum Input {
    case rectangleButtonDidTapped
  }

  enum Output {
    case rectangleDidCreated(rectangle: Rectangle)
  }
  
  private(set) var rectangles = [Rectangle]()
  private var cancellables = Set<AnyCancellable>()
  private let output = PassthroughSubject<Output, Never>()
  
  func transform(input: AnyPublisher<Input, Never>, boundary: Boundary) -> AnyPublisher<Output, Never> {
    input.sink { [weak self] event in
      switch event {
      case .rectangleButtonDidTapped:
        self?.createRectangle(boundary)
      }
    }
    .store(in: &cancellables)
    return output.eraseToAnyPublisher()
  }

  private func createRectangle(_ boundary: Boundary) {
    let factory = RectangleFactory()
    let rectangle = factory.create(boundary)
    rectangles.append(rectangle)
    output.send(.rectangleDidCreated(rectangle: rectangle))
  }
}
