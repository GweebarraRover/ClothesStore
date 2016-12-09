//
//  WishlistViewController.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 07/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class WishlistViewController: BaseTableViewController, WishlistCellDelegate {

    var wishlist = cacheProducts(key: wishlistKey)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableViewSetUp() {
        tableView.estimatedRowHeight = 180.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "WishlistTableViewCell", bundle: nil), forCellReuseIdentifier: "wishlistCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishlist?.count ?? 0
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistCell", for: indexPath) as! WishlistTableViewCell
        cell.populateCellWith(product: wishlist![indexPath.row])
        cell.delegate = self
        return cell
     }

    // MARK: - Cell Deleagte
    
    func addToBasket(product: Product) {

        if let quantity = product.quantity {
            if quantity > 0 {
                deleteFromCache(deleteProduct: product, key: wishlistKey)
                addToCache(product: product, key: basketKey)
                self.refreshWishlist()
                alertAdded(to: "basket")
                storeManager.addProductToBasket(product: product)

            } else {
                showAlert(title: "OUT OF STOCK", message: "You cannot add this product to your basket as it is currently out of stock.")
            }
        }
    }
    
    func removeFromWishlist(product: Product) {
        deleteFromCache(deleteProduct: product, key: wishlistKey)
        self.refreshWishlist()
    }
    
    func refreshWishlist() {
        wishlist = cacheProducts(key: wishlistKey)
        tableView.reloadData()
    }

}
