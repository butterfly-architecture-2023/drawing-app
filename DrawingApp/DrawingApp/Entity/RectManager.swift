//
//  RectangleMaker.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import UIKit

import RxSwift

protocol RectangleManagerable {
    func makeRandomRect() -> Observable<Rect>
}

final class RectManager: RectangleManagerable {
    private let window: CGRect
    private let rectSize: CGSize
    
    init(window: CGRect = UIScreen.main.bounds, rectSize: CGSize = CGSize(width: 100, height: 100)) {
        self.window = window
        self.rectSize = rectSize
    }
    
    func makeRandomRect() -> Observable<Rect> {
        let randomRect = Rect(window: self.window, size: self.rectSize)
        return Observable.just(randomRect)
    }
}
