//
//  filterVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class filterVC: UIViewController {

    
    
    @IBOutlet weak var catTF: UITextField!
    @IBOutlet weak var fromTF: UITextField!
    @IBOutlet weak var toTF: UITextField!
    @IBOutlet weak var maxTF: UITextField!
    @IBOutlet weak var minTF: UITextField!
    @IBOutlet weak var keyTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageText()

    }
    
    func imageText() {
        
        
        
        if let myImage = UIImage(named: "calendar"){
            
            fromTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "calendar"){
            
            toTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }

}
