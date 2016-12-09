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
    var categories = [[Product]]()

    init(jsonData: JSON?) {
        super.init()
        if jsonData != nil {
            for productData in jsonData! {
                let product = Product(json: productData.1)
                products.append(product)
            }
        }
        categories = sortedCategory(products: products)
    }
    
    func sortedCategory(products: [Product]) -> [[Product]] {

        var sortedCategories = [[Product]]()
        for product in products {
            if !sortedCategories.indices.contains(product.type.hashValue) {
                sortedCategories.append([product])
            }
            else {
                sortedCategories[product.type.hashValue].append(product)
            }
        }
        return sortedCategories
    }
    


}
