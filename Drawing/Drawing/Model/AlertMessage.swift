//
//  AlertMessage.swift
//  Drawing
//
//

import UIKit

enum AlertMessage {
    case loginSuccess
    case loginFailure
    case serverConnectionSuccess
    case serverConnectionFailure
    case chatSuccess
    case chatFailure

    var title: String {
        switch self {
        case .loginSuccess:
            return "로그인 성공"
        case .loginFailure:
            return "로그인 실패"
        case .serverConnectionSuccess:
            return "서버 연결 성공"
        case .serverConnectionFailure:
            return "서버 연결 실패"
        case .chatSuccess:
            return "채팅 성공"
        case .chatFailure:
            return "채팅 실패"
        }
    }

    var message: String {
        switch self {
        case .loginSuccess:
            return "로그인에 성공했습니다."
        case .loginFailure:
            return "로그인에 실패했습니다. 자격 증명을 확인하고 다시 시도하세요."
        case .serverConnectionSuccess:
            return "서버에 성공적으로 연결되었습니다."
        case .serverConnectionFailure:
            return "서버 연결에 실패했습니다. 나중에 다시 시도하세요."
        case .chatSuccess:
            return "채팅 메시지가 성공적으로 전송되었습니다."
        case .chatFailure:
            return "채팅 메시지 전송에 실패했습니다. 다시 시도하세요."
        }
    }
}

