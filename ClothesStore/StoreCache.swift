//
//  StoreCache.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 08/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import Foundation

let wishlistKey = "wishlist"
let basketKey = "basket"

func cacheProducts(key:String) -> [Product]? {
    if let data = UserDefaults.standard.object(forKey: key) as? Data {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as! [Product]?
    }
    return nil
}

func addToCache(product: Product, key:String) {
    if let data = UserDefaults.standard.object(forKey: key) as? Data {
        if var products = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Product] {
            switch key {
            case wishlistKey:
                product.wishlisted = true
            default:
                product.inBasket = true
            }
            products.append(product)
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: products), forKey:key)
        }
    }
    else {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: [product]), forKey:key)
    }
}

func deleteFromCache(deleteProduct: Product, key:String) {
    if let data = UserDefaults.standard.object(forKey: key) as? Data {
        if var products = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Product] {
            var index = 0
            for product in products {
                if product.productId == deleteProduct.productId {
                    switch key {
                    case wishlistKey:
                        deleteProduct.wishlisted = false
                    default:
                        deleteProduct.inBasket = false
                    }
                    products.remove(at: index)
                    break
                }
                index += 1
            }
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: products), forKey:key)
        }
    }
}

func clearCache(forKey:String) {
    UserDefaults.standard.removeObject(forKey: forKey)
}

func existsInCache(product: Product, forKey: String) -> Bool {
    if let data = UserDefaults.standard.object(forKey: forKey) as? Data {
        if let products = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Product] {
            for cacheProduct in products {
                if cacheProduct.productId == product.productId {
                    return true
                }
            }
            return false
        }
        return false
    }
    return false
}
