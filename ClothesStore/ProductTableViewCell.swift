//
//  ProductTableViewCell.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 07/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productOldPrice: UILabel!
    @IBOutlet weak var productNewPrice: UILabel!
    @IBOutlet weak var productStock: UILabel!
    
    @IBOutlet weak var bottomlv: UIView! {
        didSet {
            bottomlv.backgroundColor = UIColor.lightText
        }
    }
    
    func populateCellWith(product: Product) {
        
    }
    
}
