//
//  WishlistTableViewCell.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 08/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

protocol WishlistCellDelegate {
    func addToBasket(product: Product)
    func removeFromWishlist(product: Product)
}

class WishlistTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var delegate: WishlistCellDelegate?

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
    }
    
    @IBAction func addToBasket() {
        delegate?.addToBasket(product: product)
    }
    
    @IBAction func removeFromWishlist() {
        delegate?.removeFromWishlist(product: product)
    }
    
}
