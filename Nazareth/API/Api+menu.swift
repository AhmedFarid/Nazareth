//
//  Api+menu.swift
//  Nazareth
//
//  Created by Farido on 10/2/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Api_menu: NSObject {
    
    class func evants(url:String, completion: @escaping (_ error: Error?,_ sparParts: [event]?)-> Void) {
        
        let url = url
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let headers = [
            "X-localization": lang
        ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [event]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = event.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func profile(completion: @escaping (_ error: Error?, _ success: Bool, _ title: String?,_ short_description: String?,_ description: String?)->Void) {
        
        let url = URLs.policies
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let title = json["data"]["title"].string {
                    let short_description = json["data"]["short_description"].string
                    let description = json["data"]["description"].string
                    completion(nil, true, title,short_description,description)
                }
                
            }
        }
    }
    
    class func sendMessage(name: String,phone: String,email: String,message: String,completion: @escaping (_ error: Error?,_ data: String?)-> Void) {
        
        let url = URLs.contactUs
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "name": name,
            "phone": phone,
            "email": email,
            "message": message
        ]
        print(parameters)
        let headers = [
            "X-localization": lang
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                if let data = json["message"].string {
                    completion(nil, data)
                }
                
            }
        }
    }
    
    class func setReview(review: Int,product_id: Int,name: String,email: String,comment: String,completion: @escaping (_ error: Error?,_ data: String?)-> Void) {
        
        let url = URLs.setReview
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "name": name,
            "comment": comment,
            "email": email,
            "review": review,
            "product_id": product_id
            ] as [String : Any]
        print(parameters)
        let headers = [
            "X-localization": lang
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                if let data = json["message"].string {
                    completion(nil, data)
                }
                
            }
        }
    }
    
    
    class func reviews(product_id:String, completion: @escaping (_ error: Error?,_ sparParts: [reviewsData]?)-> Void) {
           
        let url = URLs.getReview
           let lang = NSLocalizedString("en", comment: "profuct list lang")
        
           let parameters = [
           "product_id": product_id
           ] as [String : Any]
        
        print(parameters)
        
        
           let headers = [
               "X-localization": lang
           ]
           
           Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
               switch response.result
               {
               case .failure(let error):
                   completion(error, nil)
                   print(error)
                   
               case .success(let value):
                   print(value)
                   let json = JSON(value)
                   guard let dataArray = json["data"].array else{
                       completion(nil, nil)
                       return
                   }
                   print(dataArray)
                   var products = [reviewsData]()
                   for data in dataArray {
                       if let data = data.dictionary, let prodect = reviewsData.init(dict: data){
                           products.append(prodect)
                       }
                   }
                   completion(nil, products)
               }
           }
       }
    
    
    class func social_links(completion: @escaping (_ error: Error?, _ success: Bool, _ facebook: String?,_ youtub: String?,_ twitter: String?, _ instagram: String?,_ snapchat: String?,_ linkedin: String?)->Void) {
        
        let url = URLs.social_links
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,nil,nil,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let facebook = json["data"]["facebook"].string {
                    let youtub = json["data"]["youtub"].string
                    let twitter = json["data"]["twitter"].string
                    let instagram = json["data"]["instagram"].string
                    let snapchat = json["data"]["snapchat"].string
                    let linkedin = json["data"]["linkedin"].string
                    completion(nil, true, facebook,youtub,twitter,instagram,snapchat,linkedin)
                }
                
            }
        }
    }
}


