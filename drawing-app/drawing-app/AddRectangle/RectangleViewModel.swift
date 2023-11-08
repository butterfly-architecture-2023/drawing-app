//
//  RectangleViewModel.swift
//  drawing-app
//
//  Created by 박진섭 on 11/8/23.
//

import Foundation
import Combine

final class RectangleViewModel {
    let addedRectangleSubject = PassthroughSubject<Rectangle, Never>()
    private var selectedRectangle = PassthroughSubject<Rectangle, Never>()

    private let randomRectangleFactory = RandomRectangleFactory()

    func addRandomRectanlge(in boundary: Boundary) {
        let rectangle = randomRectangleFactory.make(in: boundary)
        addedRectangleSubject.send(rectangle)
    }
}

extension RectangleViewModel: RectangleViewDelegate {
    func tap(_ id: Int) {

    }

}
