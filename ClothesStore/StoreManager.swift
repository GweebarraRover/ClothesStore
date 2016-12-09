//
//  StoreManager.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol StoreManagerDelegate {
    func responseRecieved()
}

class StoreManager: NSObject {
    
    let url = URL(string: "https://private-anon-25b3d2ee4c-ddshop.apiary-mock.com/products")!
    let addProductUrl = URL(string: "https://private-anon-25b3d2ee4c-ddshop.apiary-mock.com/cart/1")!

    var delegate: StoreManagerDelegate?
    
    var productParser: ProductParser?
    
    func initialStoreAPICall(delegate: StoreManagerDelegate) {
        self.delegate = delegate
        Alamofire.request(url).validate().responseJSON { [weak self] (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    self?.productParser = ProductParser(jsonData: JSON(value))
                    self?.delegate?.responseRecieved()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addProductToBasket(product: Product) {
        if product.productId != nil {
            let parameters: [String: Int] = [
                "productId" : product.productId!
            ]
            
            let headers = [
                "Content-Type": "application/json"
            ]
            
            Alamofire.request(addProductUrl, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        if let value = response.result.value {
                            print(value)
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
        }
    }
    
    func deleteProductFromBasket(product: Product) {
        if product.productId != nil {
            let parameters: [String: Int] = [
                "productId" : product.productId!
            ]
            
            let headers = [
                "Content-Type": "application/json"
            ]
            
            Alamofire.request(addProductUrl, method: .delete, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        if let value = response.result.value {
                            print(value)
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
        }
    }
}
