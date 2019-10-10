//
//  setReviewVC.swift
//  Nazareth
//
//  Created by Farido on 10/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class setReviewVC: UIViewController {
    
     var singleItem: prodectData?

    @IBOutlet weak var stars: CosmosView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var commentTF: messageTV!
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
         
         
         @IBAction func sendBTN(_ sender: Any) {
             guard let names = nameTF.text, !names.isEmpty else {
                 let messages = NSLocalizedString("enter your name", comment: "hhhh")
                 let title = NSLocalizedString("Register Filed", comment: "hhhh")
                 self.showAlert(title: title, message: messages)
                 return
             }
            
            guard let comment = commentTF.text, !comment.isEmpty else {
                let messages = NSLocalizedString("enter your comment", comment: "hhhh")
                let title = NSLocalizedString("Register Filed", comment: "hhhh")
                self.showAlert(title: title, message: messages)
                return
            }
             
             
             guard let emails = emailTF.text, !emails.isEmpty else {
                 let messages = NSLocalizedString("enter your Email", comment: "hhhh")
                 let title = NSLocalizedString("Register Filed", comment: "hhhh")
                 self.showAlert(title: title, message: messages)
                 return
             }
             
             if isValidEmail(testStr: emails) == false {
                 let messages = NSLocalizedString("email not correct", comment: "hhhh")
                 let title = NSLocalizedString("Register Filed", comment: "hhhh")
                 self.showAlert(title: title, message: messages)
             }
             
             
            Api_menu.setReview(review: Int(stars.rating), product_id: singleItem?.id ?? 0, name: names, email: emails, comment: comment){ (error: Error?, data) in
                 self.showAlert(title: "Contact us", message: data ?? "")
             }
         }
         
         func isValidEmail(testStr:String) -> Bool {
             let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
             
             let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
             return emailTest.evaluate(with: testStr)
         }
}