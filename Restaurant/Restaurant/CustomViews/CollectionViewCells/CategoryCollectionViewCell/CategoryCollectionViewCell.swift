//
//  CategoryCollectionViewCell.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit
import Kingfisher


class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!

    static let identifier = "CategoryCollectionViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.backgroundColor = .green

    }

    func configureCategory(with category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
