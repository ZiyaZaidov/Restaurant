//
//  OnboardingCollectionViewCell.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    static let identifier = "OnboardingCollectionViewCell"
    
    func configureCell(_ slide: OnboardingSlides){
        slideImage.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
