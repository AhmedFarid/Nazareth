//
//  allProdectCell.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class allProdectCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8279777169, green: 0.8279777169, blue: 0.8279777169, alpha: 1)
    }
}
