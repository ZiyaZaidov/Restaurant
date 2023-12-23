//
//  DetailsVC.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 28.11.2023.
//

import UIKit
import Kingfisher


class DetailsVC: UIViewController {

    @IBOutlet weak var detailsmageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         configureView()
        
    }
    
    @IBAction func orderTapped(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else { print("Enter your Name"); return }
        
        NetworkManager.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self] result in
            switch result {
            case .success(let order):
                print("Order it`s taken")
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureView() {
        detailsmageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.caloriesFormatted
        descriptionLabel.text = dish.description
    }
    
}
