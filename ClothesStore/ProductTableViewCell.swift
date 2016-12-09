//
//  ProductTableViewCell.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 07/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func addToWishlist(product: Product)
    func addToBasket(product: Product)
}

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var delegate: ProductCellDelegate?
    var product: Product!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productOldPrice: UILabel!
    @IBOutlet weak var productNewPrice: UILabel!
    @IBOutlet weak var productStock: UILabel!
    
    @IBOutlet weak var bottomlv: UIView! {
        didSet {
            bottomlv.backgroundColor = UIColor().backgroundGrey
        }
    }
    
    func populateCellWith(product: Product) {
        self.product = product
        productName.text = product.name
        productOldPrice.attributedText = attributeStringWithCurrency(symobol: "£", amount: product.oldPrice, strikeThrough: true)
        productNewPrice.attributedText = attributeStringWithCurrency(symobol: "£", amount: product.price, strikeThrough: false)
        productStock.text = stockStringWith(quantity: product.quantity)
        
        if product.wishlisted == true {
            wishlistButton.setTitle("Remove from wishlist", for: .normal)
        } else {
            wishlistButton.setTitle("Add to wishlist", for: .normal)
        }
    }
    
    @IBOutlet weak var wishlistButton: ProductButton!
    
    @IBAction func addToWishlist() {
        delegate?.addToWishlist(product: product)
    }
    
    @IBAction func addToBasket() {
        delegate?.addToBasket(product: product)
    }
    
}
