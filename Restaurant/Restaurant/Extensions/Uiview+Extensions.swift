//
//  Uiview+Extensions.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat{
        get{ return cornerRadius}
        set{ self.layer.cornerRadius = newValue }
    }
}
