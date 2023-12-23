//
//  APIResponse.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 01.12.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    
    let status: Int
    let message: String?
    let data: T?
    let error: String?
    
}
