//
//  sideMenuVC.swift
//  Nazareth
//
//  Created by Farido on 8/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class sideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    

     @IBAction func artcilesBTN(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "articl") as! ArticlesVC
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)

     }
     

}
