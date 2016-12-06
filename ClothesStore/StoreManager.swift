//
//  StoreManager.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 06/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class StoreManager: NSObject {

    override init() {
        super.init()
        self.initialStoreAPICall()
    }
    
    func initialStoreAPICall() {
        let url = URL(string: "https://private-anon-25b3d2ee4c-ddshop.apiary-mock.com/products")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response, let data = data {
                print(response)
                print(String(data: data, encoding: .utf8))
            } else {
                print(error)
            }
        }
        
        task.resume()
    }
}
