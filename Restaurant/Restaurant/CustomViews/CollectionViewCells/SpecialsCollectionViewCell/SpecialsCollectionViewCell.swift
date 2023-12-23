//
//  SpecialsCollectionViewCell.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 28.11.2023.
//

import UIKit
import Kingfisher

class SpecialsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var specialsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriprionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    static let identifier = "SpecialsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureSpecials(with dish: Dish) {
        specialsImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriprionLabel.text = dish.description
        caloriesLabel.text = dish.caloriesFormatted
    }
    
}
