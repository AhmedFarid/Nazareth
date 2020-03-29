//
//  AppDelegate.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import MOLH


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable{

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        MOLH.shared.activate(true)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: UIControl.State.highlighted)
        GMSServices.provideAPIKey("AIzaSyAYa9PutX374CC1LDExidruKitbpdf0hgk")
        return true
    }
    
    func reset() {
           let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
           let stry = UIStoryboard(name: "Main", bundle: nil)
           rootviewcontroller.rootViewController = stry.instantiateInitialViewController()
       }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

