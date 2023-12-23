//
//  CardView.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit

class CardView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetup()
    }
    
    private func initSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 6
        cornerRadius = 6
    }
}
