//
//  allProdectCell.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class allProdectCell: UICollectionViewCell {
    @IBOutlet weak var imagess: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rate: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8279777169, green: 0.8279777169, blue: 0.8279777169, alpha: 1)
    }
    
    func configuerCell(prodect: prodectData) {
        
        name.text = prodect.name
        rate.rating = Double(prodect.average_rating)
        imagess.image = UIImage(named: "3")
        let s = prodect.image
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        imagess.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imagess.kf.setImage(with: url)
        }
    }
}
