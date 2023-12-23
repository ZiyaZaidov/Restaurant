//
//  DishCategory.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import Foundation

struct DishCategory: Decodable {
    let id: String?
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}

