//
//  Mock.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/15.
//

@testable import Drawing

class MockChatServerUseCaseImpl: ChatServerUseCase {
    var runCalled: Bool!
    
    var delegate: ChatServerDelegate?
    
    init() {}
    
    func run() {
        runCalled = true
    }
}

class MockChatClientUseCase: ChatClientUseCase {
    var networkInfo = NetworkInfo.basePoint
    
    var connection: NWConnectionProtocol?
    var loginResult: Bool!
    var chatResult: Bool!
    var serverConnectResult: Bool!
    
    func connectToServer(completion: @escaping (Bool) -> Void) {
        serverConnectResult = true
        completion(true)
    }
    
    func sendLoginRequest(id: String, completion: @escaping (Bool) -> Void) {
        loginResult = true
        completion(true)
    }
    
    func sendChatRequest(drawingInfos: [Drawing.DrawingInfo], completion: @escaping (Bool) -> Void) {
        chatResult = true
        completion(true)
    }
    
}


class MockDrawingPresentationLogic: DrawingPresentationLogic {
    var presentDrawingInfoCalled: Bool!
    var sendLoginRequestCalled: Bool!
    var alertMessage: AlertMessage!
    
    func presentRectangle(info: DrawingInformation) {
    }
    
    func presentDrawingLine(drawingPath: DrawingInformation) {
    }
    
    func presentEndDrawingLine(drawingPath: DrawingInformation) {
    }
    
    func presentRequestFail(failMessage: AlertMessage) {
        alertMessage = failMessage
    }
    
    func presentLoginResult() {
        sendLoginRequestCalled = true
    }
    
    func presentChatResult() {
        presentDrawingInfoCalled = true
    }
}

class MockDrawingInteractor: DrawingBusinessLogic, DrawingDataSource, ChatServerDelegate {
    lazy var presenter = MockDrawingPresentationLogic()
    lazy var drawUseCase: DrawingUseCase = DrawingUseCaseImpl()
    lazy var chatClientUseCase = MockChatClientUseCase()
    lazy var server = MockChatServerUseCaseImpl()

    var drawingResource: [DrawingInfo] = [DrawingInfo]()


    init() {
        server.delegate = self
    }
    
    func syncDrawingInfo() {
        chatClientUseCase.sendChatRequest(drawingInfos: []) { _ in
            self.presenter.presentChatResult()
        }
    }
    
    func requestLogin(id: String) {
        chatClientUseCase.sendLoginRequest(id: id) { _ in
            self.presenter.presentLoginResult()
        }
    }
    
    func didConnectFail() {
        presenter.presentRequestFail(failMessage: .serverConnectionFailure)
    }
    
    func serverFetch() {
        server.run()
        chatClientUseCase.connectToServer { _ in
            
        }
    }
    
    func startDrawLine(drawPoint: DrawPoint) { }
    
    func makeDrawingLine(drawPoint: DrawPoint) { }
    
    func endDrawingLine() { }
    
    func didReceiveResponse(_ response: CommandResponse) { }
    
    func makeRectangle(drawRect: DrawingRect) { }
}
