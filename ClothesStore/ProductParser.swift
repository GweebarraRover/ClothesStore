//
//  ProductParser.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductParser: NSObject {

    var products = [Product]()
    
    init(jsonData: JSON) {
        super.init()
        for productData in jsonData {
            let product = Product(json: productData.1)
            products.append(product)
        }
        self.productCategories()
    }
    
    var categories = [[Product]]()

    func productCategories() {
        for product in products {
            insertProductIntoCategory(product: product)
        }
    }
    
    func insertProductIntoCategory(product: Product) {
        
        if !categories.indices.contains(product.type.hashValue) {
            categories.append([product])
        }
        else {
            categories[product.type.hashValue].append(product)
        }
    }
    


}
