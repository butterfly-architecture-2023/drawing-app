//
//  AddRectangleButtonViewModel.swift
//  drawing-app
//
//  Created by 박진섭 on 11/5/23.
//

struct RandomRectangleFactory {

    func make(maxXPosition: Double, maxYPosition: Double) -> Rectangle {
        let width = 100.0
        let height = 100.0
        let maxXPosition = maxXPosition - width
        let maxYPosition = maxYPosition - height
        let randomXPosition = Double.random(in: 0...maxXPosition)
        let randomYPosition = Double.random(in: 0...maxYPosition)
        let randomRedValue = Double(Int.random(in: 0...255)) / 255
        let randomGreenValue = Double(Int.random(in: 0...255)) / 255
        let randomBlueValue = Double(Int.random(in: 0...255)) / 255
        let randomAlphaValue = Double.random(in: 0...1)
        let randomRectangle = Rectangle(width: width, height: height,
                                        x: randomXPosition, y: randomYPosition,
                                        style: .init(backgroundRGBA: .init(
                                            red: randomRedValue,
                                            green: randomGreenValue,
                                            blue: randomBlueValue,
                                            alpha: randomAlphaValue), borderRGBA: nil, borderWidth: nil))
        return randomRectangle
    }

}
