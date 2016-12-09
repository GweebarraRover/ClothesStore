//
//  BasketTableViewController.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 08/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class BasketTableViewController: BaseTableViewController, BasketCellDelegate {

    var basket = cacheProducts(key: basketKey) {
        didSet {
            basketTotalView?.displayTotalFor(products: basket)
        }
    }

    var basketTotalView: BasketTotalView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
    }

    override func addNavBarButton() {
        navigationItem.rightBarButtonItem = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func setUpTableView() {
        basketTotalView = Bundle.main.loadNibNamed("BasketTotalView", owner: self, options: nil)?[0] as? BasketTotalView
        tableView.tableFooterView = basketTotalView
        basketTotalView?.displayTotalFor(products: basket)
        tableView.estimatedRowHeight = 110.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "basketCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket?.count ?? 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketTableViewCell
        cell.populateCellWith(product: basket![indexPath.row])
        cell.delegate = self
        return cell
     }

    // MARK: - Cell Deleagte

    func removeFromBasket(product: Product) {
        deleteFromCache(deleteProduct: product, key: basketKey)
        basket = cacheProducts(key: basketKey)
        tableView.reloadData()
    }

}
