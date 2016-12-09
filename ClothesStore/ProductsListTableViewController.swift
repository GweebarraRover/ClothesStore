//
//  ProductsListTableViewController.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 07/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class ProductsListTableViewController: BaseTableViewController, ProductCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    var products: [Product]?
    
    func tableViewSetUp() {
        tableView.estimatedRowHeight = 108.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        cell.delegate = self
        cell.populateCellWith(product: products![indexPath.row])
        return cell
    }
    
    // MARK: - Cell Delegates
    
    func addToWishlist(product: Product) {
        if product.wishlisted == true {
            deleteFromCache(deleteProduct: product, key: wishlistKey)
            alertRemoved(from: "wishlist")
        } else {
            addToCache(product: product, key: wishlistKey)
            alertAdded(to: "wishlist")
        }
        tableView.reloadData()
    }
    
    func addToBasket(product: Product) {
        if let quantity = product.quantity {
            if quantity > 0 {
                addToCache(product: product, key: basketKey)
                storeManager.addProductToBasket(product: product)
                alertAdded(to: "basket")
            } else {
                showAlert(title: "OUT OF STOCK", message: "You cannot add this product to your basket as it is currently out of stock.")
            }
        }
    }

}
