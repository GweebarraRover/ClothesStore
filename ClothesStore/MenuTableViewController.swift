//
//  MenuTableViewController.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 07/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class MenuTableViewController: BaseTableViewController {

    let menuOptions = ["Categories", "All products", "My wishlist", "My basket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    func tableViewSetUp() {
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.menuTitle.text = menuOptions[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch menuOptions[indexPath.row] {
        case menuOptions[0]:
            self.performSegue(withIdentifier: "category", sender: nil)
        case menuOptions[1]:
            self.performSegue(withIdentifier: "products", sender: nil)
        case menuOptions[2]:
            self.performSegue(withIdentifier: "wishlist", sender: nil)
        case menuOptions[3]:
            self.performSegue(withIdentifier: "basket", sender: nil)
        default:
            break
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "products" {
            if let products = segue.destination as? ProductsListTableViewController {
                products.products = storeManager.productParser?.products
            }
        }
    }

}
