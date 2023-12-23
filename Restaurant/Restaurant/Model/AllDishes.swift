//
//  AllDishes.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 01.12.2023.
//

import Foundation

struct AllDishes: Decodable {
    
    let dishCategories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
    
    
}
