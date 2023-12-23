//
//  Dish.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import Foundation

struct Dish: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var caloriesFormatted: String {
        "\(calories ?? 0) calories"
    }
    
    
}
