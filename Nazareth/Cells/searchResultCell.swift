//
//  searchResultCell.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class searchResultCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        self.img.layer.cornerRadius = 8.0
        self.img.layer.borderWidth = 0.0
        self.img.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        bounds = bounds.inset(by: padding)
        
    }

}
