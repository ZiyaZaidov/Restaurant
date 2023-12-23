//
//  DishListVC.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 29.11.2023.
//

import UIKit

class DishListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "Category1", name: "Category1", description: "dwdjjddwdjjddwdjjddwdjjddwdjjddwdjjdr", image: "https://picsum.photos/200/200", calories: 12),
        .init(id: "Category2", name: "Category2", description: "dwdjjd", image: "https://picsum.photos/300/300", calories: 12),
        .init(id: "Category3", name: "Category3", description: "dwdjjd", image: "https://picsum.photos/200/200", calories: 12),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        title = category?.name
    }
    
}


extension DishListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.configureCell(with: dishes[indexPath.row])

        return cell
    }

   
    
}
