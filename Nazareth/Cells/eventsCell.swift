//
//  eventsVC.swift
//  Nazareth
//
//  Created by Farido on 10/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class eventsCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventSmallDes: UILabel!
    @IBOutlet weak var viewDigen: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewDigen.layer.cornerRadius = 8.0
        self.viewDigen.layer.borderWidth = 1.0
        self.viewDigen.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.viewDigen.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
        self.img.layer.cornerRadius = 8.0
        self.img.layer.borderWidth = 0.0
        self.img.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.img.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }
    
    
    override var frame: CGRect {
      get {
          return super.frame
      }
      set (newFrame) {
          var frame =  newFrame
          frame.origin.y += 4
          frame.size.height -= 2 * 5
          super.frame = frame
      }
    }
    
    func configuerCell(prodect: event) {
        
        eventName.text = prodect.title
        eventSmallDes.text = prodect.short_description
        img.image = UIImage(named: "3")
        let s = prodect.image
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url)
        }
    }
    
    
}



