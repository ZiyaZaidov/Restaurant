//
//  Error.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 30.11.2023.
//

import Foundation

enum AppError:LocalizedError {
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String?{
        switch self {
            
        case .errorDecoding:
        return "Response could`t not be decoded"
        case .unknownError:
            return "Unknow error"
        case .invalidURL:
            return "invalid URL"
        case .serverError(let error):
            return error
        }
    }
}
