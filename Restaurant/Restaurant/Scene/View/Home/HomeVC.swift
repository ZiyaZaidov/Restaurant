//
//  HomeVC.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    

    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self

        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        
        
        NetworkManager.shared.fetchAllCategories { [weak self] result in
            switch result {
                
            case .success(let allDishess):
                self?.categories = allDishess.dishCategories ?? []
                self?.populars = allDishess.populars ?? []
                self?.specials = allDishess.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                print("Error - \(error.localizedDescription)")
            }
        }
    
        registerNIB()
        
    }
    
    private func registerNIB(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        specialsCollectionView.register(UINib(nibName: SpecialsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SpecialsCollectionViewCell.identifier)
    }

}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case categoryCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.configureCategory(with: categories[indexPath.row])
            return cell
            
        case popularCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.configurePopular(with: populars[indexPath.row ])
            return cell
            
        case specialsCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialsCollectionViewCell.identifier, for: indexPath) as! SpecialsCollectionViewCell
            cell.configureSpecials(with: specials[indexPath.row ])
            return cell
        default:
            return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCollectionView {
            let controller = DishListVC.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            controller.modalPresentationStyle = .fullScreen
        }
        else {
            let controller = DetailsVC.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            controller.modalPresentationStyle = .fullScreen
        }
    }
}
