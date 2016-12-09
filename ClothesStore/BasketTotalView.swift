//
//  BasketTotalView.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 08/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class BasketTotalView: UIView {
   
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmount: UILabel!

    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor().backgroundGrey
    }

    func displayTotalFor(products: [Product]?) {
        if products != nil {
            var total = 0.00
            for product in products! {
                if product.price != nil {
                    total += product.price!
                }
            }
            totalAmount.attributedText = attributeStringWithCurrency(symobol: "£", amount: total, strikeThrough: false)
        }
    }
    
}
