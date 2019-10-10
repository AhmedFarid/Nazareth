//
//  eventsDetialsVC.swift
//  Nazareth
//
//  Created by Farido on 10/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class eventsDetialsVC: UIViewController {

    
    var singleItem: event?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titels: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var des: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    
    func setUpView(){
        
        titels.text = singleItem?.title
        date.text = singleItem?.date_time
        des.text = singleItem?.descript
        
        image.image = UIImage(named: "3")
        let s = singleItem?.image
        let encodedLink = s?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
    }

}
