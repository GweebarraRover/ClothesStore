//
//  StringFormatter.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 07/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import Foundation
import UIKit

func attributeStringWithCurrency(symobol: Character, amount: Double?, strikeThrough: Bool) -> NSMutableAttributedString {
    if let amount = amount {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(symobol) \(String(format: "%.2f", amount))")
        if strikeThrough {
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
            return attributeString
        }
        return attributeString
    }
    return NSMutableAttributedString(string: "")
}


func stockStringWith(quantity: Int?) -> String{
    if let quantity = quantity {
        if quantity == 0 {
            return "OUT OF STOCK"
        }
        else {
            return "\(quantity) left in stock"
        }
    }
    return ""
}
