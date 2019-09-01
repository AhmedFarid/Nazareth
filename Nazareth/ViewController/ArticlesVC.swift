//
//  ArticlesVC.swift
//  Nazareth
//
//  Created by Farido on 8/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    

    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
