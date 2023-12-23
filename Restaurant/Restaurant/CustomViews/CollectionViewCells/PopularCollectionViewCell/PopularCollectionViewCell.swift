//
//  PopularCollectionViewCell.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descrptionLabel: UILabel!

    static let identifier = "PopularCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurePopular(with dish: Dish) {
        titleLabel.text = dish.name
        popularImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.caloriesFormatted
        descrptionLabel.text = dish.description
    }
}
