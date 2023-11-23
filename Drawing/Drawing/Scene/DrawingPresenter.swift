//
//  DrawingPresenter.swift
//  Drawing
//
//  Created by 우리캐피탈 on 2023/11/13.
//

import Foundation

protocol DrawingPresentationLogic {
    func presentRectangle(info: DrawingInformation)
    func presentDrawingLine(drawingPath: DrawingInformation)
    func presentEndDrawingLine(drawingPath: DrawingInformation)
    func presentRequestFail(failMessage: AlertMessage)
    func presentLoginResult()
    func presentChatResult()
}

class DrawingPresenter: DrawingPresentationLogic {
    weak var viewController: DrawingDisplayLogic?
    
    func presentRectangle(info: DrawingInformation) {
        viewController?.displayDrawing(info: info)
    }
    
    func presentDrawingLine(drawingPath: DrawingInformation) {
        viewController?.displayDrawingLine(info: drawingPath)
    }
    
    func presentEndDrawingLine(drawingPath: DrawingInformation) {
        viewController?.displayEndDrawingLine(info: drawingPath)
    }
    
    func presentLoginResult() {
        viewController?.displayLoginResult(success: true)
    }
    
    func presentRequestFail(failMessage: AlertMessage) {
        viewController?.displayRequestFail(failMessage: failMessage)
    }
    
    func presentChatResult() {
        viewController?.displayChatResult(drawingInfo: [])
    }
}
