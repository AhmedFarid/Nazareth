//
//  aboutUsVC.swift
//  Nazareth
//
//  Created by Farido on 10/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class aboutUsVC: UIViewController {
    
    
    @IBOutlet weak var titels: UILabel!
    @IBOutlet weak var dec: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
        setUpProfile()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setUpProfile()
    }
    
    func setUpProfile(){
        Api_menu.profile { (error: Error?, success: Bool, title,short_description,description)  in
            if success {
                self.titels.text = title
                self.dec.text = "\(description?.htmlToString ?? "")"
            }else {
                
            }
        }
    }
    
    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
