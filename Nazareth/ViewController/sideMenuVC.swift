//
//  sideMenuVC.swift
//  Nazareth
//
//  Created by Farido on 8/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import MOLH

class sideMenuVC: UIViewController {

    var faceLink = ""
    var twiterLink = ""
    var instLink = ""
    var linkedInLink = ""
    var youtubeLink = ""
    var snapLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        getLinks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getLinks()
    }
    
    
    func getLinks() {
        Api_menu.social_links { (error, success, facebook, youtub, twitter, instagram, snapchat, linkedin) in
            self.faceLink = facebook ?? ""
            self.twiterLink = youtub ?? ""
            self.instLink = twitter ?? ""
            self.linkedInLink = instagram ?? ""
            self.youtubeLink = snapchat ?? ""
            self.snapLink = linkedin ?? ""
            
        }
    }

    @IBAction func langBTN(_ sender: Any) {
        let alert = UIAlertController(title: NSLocalizedString("Select Language", comment: ""), message: "", preferredStyle: .actionSheet)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            alert.addAction(UIAlertAction(title: "עברית", style: .destructive, handler: { (action: UIAlertAction) in
                MOLH.setLanguageTo("he")
                MOLH.reset()
            }))
            alert.addAction(UIAlertAction(title: "عربى", style: .destructive, handler: { (action: UIAlertAction) in
                MOLH.setLanguageTo("ar")
                MOLH.reset()
            }))
        }else if MOLHLanguage.currentAppleLanguage() == "ar"{
            alert.addAction(UIAlertAction(title: "English", style: .destructive, handler: { (action: UIAlertAction) in
                MOLH.setLanguageTo("en")
                MOLH.reset()
            }))
            alert.addAction(UIAlertAction(title: "עברית", style: .destructive, handler: { (action: UIAlertAction) in
                MOLH.setLanguageTo("he")
                MOLH.reset()
            }))
        }else if MOLHLanguage.currentAppleLanguage() == "he"{
            alert.addAction(UIAlertAction(title: "English", style: .destructive, handler: { (action: UIAlertAction) in
                MOLH.setLanguageTo("en")
                MOLH.reset()
            }))
            alert.addAction(UIAlertAction(title: "عربى", style: .destructive, handler: { (action: UIAlertAction) in
                MOLH.setLanguageTo("ar")
                MOLH.reset()
            }))
        }
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func artcilesBTN(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "articl") as! ArticlesVC
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)

     }
     
    @IBAction func evantBTN(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "evants") as! eventsVC
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func aboutUS(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "policies") as! aboutUsVC
               let navigationController = UINavigationController(rootViewController: vc)
               navigationController.modalPresentationStyle = .fullScreen
               self.present(navigationController, animated: true, completion: nil)
    }
    //
    @IBAction func counectUs(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "contactUs") as! countetctusVC
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    @IBAction func fbBTN(_ sender: Any) {
        UIApplication.tryURL(urls: [
        "\(faceLink)", // App
        "\(faceLink)" // Website if app fails
        ])
    }
    @IBAction func instBTN(_ sender: Any) {
        UIApplication.tryURL(urls: [
        "\(instLink)", // App
        "\(instLink)" // Website if app fails
        ])
    }
    @IBAction func linBTN(_ sender: Any) {
        UIApplication.tryURL(urls: [
        "\(linkedInLink)", // App
        "\(linkedInLink)" // Website if app fails
        ])
    }
    @IBAction func twiBTN(_ sender: Any) {
        UIApplication.tryURL(urls: [
        "\(twiterLink)", // App
        "\(twiterLink)" // Website if app fails
        ])
    }
    @IBOutlet weak var fbBTN: UIStackView!
    
}


extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!, options: [:], completionHandler: nil)
                }
                else {
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
}
