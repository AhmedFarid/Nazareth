//
//  bigimageViewerCell.swift
//  Nazareth
//
//  Created by Farido on 10/24/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class bigimageViewerCell: UICollectionViewCell,UIScrollViewDelegate  {
    
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var productImage: UIImageView!
    
    func configuerCell(prodect: prodectImages) {
        productImage.image = UIImage(named: "3")
        let s = prodect.image
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        productImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            productImage.kf.setImage(with: url)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scroll.delegate = self
        scroll.minimumZoomScale = 1
        scroll.maximumZoomScale = 3.5
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return productImage
    }
    
}
