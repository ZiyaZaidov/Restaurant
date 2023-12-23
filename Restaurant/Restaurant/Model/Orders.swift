//
//  Orders.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 29.11.2023.
//

import Foundation


struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
