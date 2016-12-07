//
//  Product.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit
import SwiftyJSON

class Product: NSObject {

    enum categoryType: String {
        case womensFootwear = "Women's Footwear"
        case mensFootwear = "Men's Footwear"
        case womensCasualwear = "Women's Casualwear"
        case mensCasualwear = "Men's Casualwear"
        case mensFormalwear = "Men's Formalwear"
        case womensFormalwear = "Women's Formalwear"
        case other = "Other"
        init() {
            self = .other
        }
    }
    
    var productId: Int?
    var name: String?
    var category: String?
    var type: categoryType
    
    var price: Double?
    var oldPrice: Double?
    var quantity: Int?
    
    init(json: JSON) {
        productId = json["productId"].int
        name = json["name"].string
        category = json["category"].string
        if categoryType.init(rawValue: category!) == nil {
            type = categoryType.init()
        }
        else {
            type = categoryType.init(rawValue: category!)!
        }
        price = json["price"].double
        oldPrice = json["oldPrice"].double
        quantity = json["stock"].int
    }
    
}

