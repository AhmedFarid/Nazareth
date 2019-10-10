//
//  prodectsCell.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class prodectsCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 0.0
        self.layer.borderColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    }
    
    
    override var isSelected: Bool {
        didSet{
            layer.cornerRadius = isSelected ? 8.0 : 8.0
            layer.backgroundColor = isSelected ? #colorLiteral(red: 0.8872488141, green: 0.3153338432, blue: 0.2478202581, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            name.textColor = isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8872488141, green: 0.3153338432, blue: 0.2478202581, alpha: 1)
        }
    }
    
    func configuerCell(prodect: subCatData) {
        name.text = prodect.name
    }
}
