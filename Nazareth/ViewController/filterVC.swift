//
//  filterVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class filterVC: UIViewController {

    
    var singleItem: homeData?
    var subCat = [subCatData]()
    @IBOutlet weak var catTF: UITextField!
    @IBOutlet weak var rate: CosmosView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc private func handleRefreshgetSubCat() {
           API_Home.SubCategories(category_id: singleItem?.id ?? 0){(error: Error?, subCat: [subCatData]?) in
               if let subCat = subCat {
                   self.subCat = subCat
                   print("xxx\(self.subCat)")
               }
           }
       }
    
    
}
