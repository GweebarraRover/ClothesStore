//
//  CategoryTableViewController.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class CategoryTableViewController: BaseTableViewController, StoreManagerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeManager.initialStoreAPICall(delegate: self)
        self.tableViewSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func responseRecieved() {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    func tableViewSetUp() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return storeManager.productParser?.categories.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        cell.categoryTitle.text = storeManager.productParser?.categories[indexPath.section][indexPath.row].category
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    var categoryProductsSelected: [Product]?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryProductsSelected = storeManager.productParser?.categories[indexPath.section]
        self.performSegue(withIdentifier: "showCategory", sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategory" {
            if let productList = segue.destination as? ProductsListTableViewController {
                productList.products = categoryProductsSelected
                productList.navigationItem.title = categoryProductsSelected?[0].category
            }
        }
    }

}
