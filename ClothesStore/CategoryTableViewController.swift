//
//  CategoryTableViewController.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController, StoreManagerDelegate {

    var storeManager: StoreManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeManager = StoreManager(delegate: self)
        self.tableViewSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func responseRecieved() {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    func tableViewSetUp() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return storeManager?.productParser?.categories.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //storeManager?.productParser?.categories[section].count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        cell.categoryTitle.text = storeManager?.productParser?.categories[indexPath.section][indexPath.row].category
        return cell
    }
    
    var categoryProductsSelected: [Product]?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryProductsSelected = storeManager?.productParser?.categories[indexPath.row]
        self.performSegue(withIdentifier: "showCategory", sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategory" {
            if let productList = segue.destination as? ProductsListTableViewController {
                productList.products = categoryProductsSelected
            }
        }
    }

}
