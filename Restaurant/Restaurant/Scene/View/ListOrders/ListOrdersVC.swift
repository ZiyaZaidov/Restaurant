//
//  ListOrdersVC.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 29.11.2023.
//

import UIKit

class ListOrdersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "1", name: "Ziya", dish: .init(id: "ifaddrs", name: "kufteBozbash", description: "et xemir", image: "https://picsum.photos/100/300", calories: 22)),
        .init(id: "1", name: "Sevil", dish: .init(id: "ifaddrs", name: "dolma", description: "et xemir", image: "https://picsum.photos/100/300", calories: 22)),
            .init(id: "1", name: "Afruz", dish: .init(id: "ifaddrs", name: "makaron", description: "et xemir", image: "https://picsum.photos/100/300", calories: 22)),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "Orders"
    }
    

   

}

extension ListOrdersVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.configureOrder(with: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailsVC.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
