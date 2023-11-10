//
//  RectangleViewModel.swift
//  drawing-app
//
//  Created by 박진섭 on 11/8/23.
//

import Combine

final class RectangleViewModel {
    private let randomRectangleFactory = RandomRectangleFactory()
    private var currentSelectedRectangleID: Int?
    private let redBorderRGBA = RGBA(red: 1, green: 0, blue: 0, alpha: 1)
    private let emptyBorderRGBA = RGBA(red: 0, green: 0, blue: 0, alpha: 0)
    let addedRectangle = PassthroughSubject<Rectangle, Never>()
    let selectedRectangleBorderColor = PassthroughSubject<RGBA, Never>()

    func addRandomRectangle(in boundary: Boundary) {
        let rectangle = randomRectangleFactory.make(in: boundary)
        addedRectangle.send(rectangle)
    }

    func changeSelectedRectangleRGBA(_ newSelectedID: Int) {
        if newSelectedID != currentSelectedRectangleID {
            selectedRectangleBorderColor.send(redBorderRGBA)
            self.currentSelectedRectangleID = newSelectedID
        } else {
            selectedRectangleBorderColor.send(emptyBorderRGBA)
            self.currentSelectedRectangleID = nil
        }
    }
}
