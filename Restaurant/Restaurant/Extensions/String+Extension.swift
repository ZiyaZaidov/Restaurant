//
//  String+Extension.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
