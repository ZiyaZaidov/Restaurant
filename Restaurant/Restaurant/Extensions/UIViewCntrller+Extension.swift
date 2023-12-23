//
//  UIViewCntrller+Extensin.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 28.11.2023.
//

import UIKit

extension UIViewController {
    static var identifer: String {
        String(describing: self)
    }
    
    static func instantiate() -> Self{
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifer) as! Self
        return controller
    }
}
