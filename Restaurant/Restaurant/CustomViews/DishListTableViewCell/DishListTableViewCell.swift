//
//  DishListTableViewCell.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 29.11.2023.
//

import UIKit
import Kingfisher


class DishListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "DishListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
//         Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func configureCell(with dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    
    func configureOrder( with order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLabel.text = order.dish?.name
        descriptionLabel.text = order.name
    }
}
