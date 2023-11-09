//
//  ViewModel.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import Foundation

protocol ViewModel {

    associatedtype State
    associatedtype Action

    var state: State { get }
    var action: Action { get }
}
