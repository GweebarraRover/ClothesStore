//
//  ProductTests.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 09/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import XCTest
@testable import ClothesStore

class ProductTests: XCTestCase {
    
    var products: [Product]?
    var product1: Product!
    var product2: Product!
    var product3: Product!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        product1 = Product(json: nil)
        product1.name = "Product 1"
        product1.category = "Women's Footwear"
        product1.type = .womensFootwear
        product1.price = 100.00
        product1.quantity = 1
        
        product2 = Product(json: nil)
        product2.name = "Product 2"
        product2.category = "Men's Footwear"
        product2.type = .mensFootwear
        product2.price = 25.00
        product2.quantity = 0
        
        product3 = Product(json: nil)
        product3.name = "Product 2"
        product3.category = "Men's Footwear"
        product3.type = .mensFootwear
        product3.price = 25.00
        product3.quantity = 7
        
        products = [product1, product2, product3]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        product1 = nil
        product2 = nil
        product3 = nil
        products = nil
    }
    
    func testTotals() {
        // Test the total of all products
        XCTAssertTrue(BasketTotalView().totalForProducts(products: products) == 150.00)
    }
    
    func testCategorySorting() {
        // Test the total of sorted products
        XCTAssertTrue(ProductParser(jsonData: nil).sortedCategory(products: products!).count == 2)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
