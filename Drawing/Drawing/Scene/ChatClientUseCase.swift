//
//  NetworkUseCase.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/14.
//

import Network
import Foundation

struct NetworkInfo {
    let serverHost: NWEndpoint.Host
    let serverPort: NWEndpoint.Port
    
    static let basePoint = NetworkInfo(serverHost: NWEndpoint.Host("localhost"),
                                       serverPort: NWEndpoint.Port(integerLiteral: 9090))
}

protocol ChatClientUseCase {
    var networkInfo: NetworkInfo  { get }
    var connection: NWConnectionProtocol? { get set }

    func connectToServer(completion: @escaping(Bool) -> Void)
    func sendLoginRequest(id: String, completion: @escaping(Bool) -> Void)
    func sendChatRequest(drawingInfos: [DrawingInfo], completion: @escaping(Bool) -> Void)
}

final class ChatClientImpl: ChatClientUseCase {
    
    let networkInfo: NetworkInfo
    var connection: NWConnectionProtocol?
    
    init(networkInfo: NetworkInfo = NetworkInfo.basePoint) {
        self.networkInfo = networkInfo
    }
    
    func connectToServer(completion: @escaping(Bool) -> Void) {
        let params = NWParameters(tls: .none, tcp: .init())
        connection = NWConnection(host: networkInfo.serverHost, port: networkInfo.serverPort, using: params)
        connection?.stateUpdateHandler = { newState in
            switch newState {
            case .ready:
               completion(true)
            case .failed(let error):
                print("서버연결 실패 Error =", error.localizedDescription)
                completion(false)
            default:
                break
            }
        }
        connection?.start(queue: .global())
    }
    
    func sendLoginRequest(id: String, completion: @escaping(Bool) -> Void) {
        let command = makeLoginRequest(id: id)
        sendRequestData(command: command, completion: completion)
        
    }
    
    func sendChatRequest(drawingInfos: [DrawingInfo], completion: @escaping(Bool) -> Void) {
        let command = makeChatRequest(drawInfo: drawingInfos)
        sendRequestData(command: command, completion: completion)
    }
    
    private func makeLoginRequest(id: String) -> Command {
        return Command(header: Request.Login, id: id)
    }
    
    private func makeChatRequest(drawInfo: [DrawingInfo]) -> Command {
        let data = try? JSONEncoder().encode(drawInfo)
        let command = Command(header: Request.Chat, id: LoginStateManager.shared.getUserId(), length: 5, data: data)
        return command
    }

    
    private func sendRequestData(command: Command, completion: @escaping(Bool) -> Void) {
        do {
            let requestData = try JSONEncoder().encode(command)
            
            connection?.send(content: requestData, completion: .contentProcessed { error in
                if let error = error {
                    print("요청 보내기 오류: \(error.localizedDescription)")
                    completion(false)
                } else {
                    print("요청 성공적으로 전송")
                    completion(true)
                }
            })
        } catch {
            print("요청 인코딩 오류: \(error.localizedDescription)")
            completion(false)
        }
    }
}
