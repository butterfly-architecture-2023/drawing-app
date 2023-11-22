//
//  EventDelegate.swift
//  DrawingApp
//
//  Created by elly on 11/14/23.
//

import Foundation

protocol EventDelegate {
    func send(_ info: any PositionProtocol)
}
