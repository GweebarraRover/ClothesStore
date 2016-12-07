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
    var delegate: StoreManagerDelegate?
    
    init(delegate: StoreManagerDelegate) {
        super.init()
        self.delegate = delegate
        self.initialStoreAPICall()
    }
    
    var productParser: ProductParser?
    
    func initialStoreAPICall() {
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
}
