//
//  BasketTableViewCell.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 08/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

protocol BasketCellDelegate {
    func removeFromBasket(product: Product)
}

class BasketTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var delegate: BasketCellDelegate?
    
    var product: Product!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productprice: UILabel!
    
    @IBOutlet weak var bottomlv: UIView! {
        didSet {
            bottomlv.backgroundColor = UIColor().backgroundGrey
        }
    }
    
    func populateCellWith(product: Product) {
        self.product = product
        productName.text = product.name
        productprice.attributedText = attributeStringWithCurrency(symobol: "£", amount: product.price, strikeThrough: false)
    }
    
    @IBAction func removeFromBasket() {
        delegate?.removeFromBasket(product: product)
    }
    
}
