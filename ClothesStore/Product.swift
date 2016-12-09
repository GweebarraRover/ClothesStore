//
//  Product.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit
import SwiftyJSON

@objc(Product)
class Product: NSObject, NSCoding {

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

    var wishlisted: Bool?
    
    var inBasket: Bool?

    required init(json: JSON) {
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
    
    required init(coder aDecoder: NSCoder) {
        self.productId = aDecoder.decodeObject(forKey: "productId") as? Int
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.category = aDecoder.decodeObject(forKey: "category") as? String
        let rawType = aDecoder.decodeObject(forKey: "type") as? String
        self.type = categoryType.init(rawValue: rawType!)!
        self.price = aDecoder.decodeObject(forKey: "price") as? Double
        self.oldPrice = aDecoder.decodeObject(forKey: "oldPrice") as? Double
        self.quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
        self.wishlisted = aDecoder.decodeObject(forKey: "wishlisted") as? Bool
        self.inBasket = aDecoder.decodeObject(forKey: "inBasket") as? Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.productId, forKey: "productId")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.category, forKey: "category")
        aCoder.encode(self.type.rawValue, forKey: "type")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.oldPrice, forKey: "oldPrice")
        aCoder.encode(self.quantity, forKey: "quantity")
        aCoder.encode(self.wishlisted, forKey: "wishlisted")
        aCoder.encode(self.inBasket, forKey: "inBasket")
    }
 
}
