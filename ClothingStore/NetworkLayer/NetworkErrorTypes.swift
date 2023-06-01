//
//  NetworkErrorTypes.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import Foundation

enum NetworkErrorTypes: Error {
    case invalidURL
    case emptyData
    case nonHTTPResponse
    case error(error: Error)
}

extension NetworkErrorTypes: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Недействительный адрес URL", comment: "URL error")
        case .emptyData:
            return NSLocalizedString("Данные не были получены", comment: "Decode error")
        case .nonHTTPResponse:
            return NSLocalizedString("Ошибка сервера", comment: "HTTPResponse error")
        case .error(let error):
            return NSLocalizedString("\(error.localizedDescription)", comment: "Error")
        }
    }
}
