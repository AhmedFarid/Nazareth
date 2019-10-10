//
//  articlesDtitlesVC.swift
//  Nazareth
//
//  Created by Farido on 10/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class articlesDtitlesVC: UIViewController {

    var singleItem: event?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titels: UILabel!
    @IBOutlet weak var des: UITextView!
    @IBOutlet weak var date: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    

    func setUpView(){
        
        titels.text = singleItem?.title
        date.text = singleItem?.date_time
        self.des.text = "\(singleItem?.descript.htmlToString ?? "")"
        
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


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


