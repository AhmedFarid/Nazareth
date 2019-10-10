//
//  API+Home.swift
//  Nazareth
//
//  Created by Farido on 9/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Home: NSObject {

    class func categories(completion: @escaping (_ error: Error?,_ sparParts: [homeData]?)-> Void) {
        
        let url = URLs.categories
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let headers = [
            "X-localization": lang
        ]
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
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
                var products = [homeData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = homeData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func SubCategories(category_id: Int,completion: @escaping (_ error: Error?,_ sparParts: [subCatData]?)-> Void) {
        
        let url = URLs.subcategories
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "category_id": category_id
        ]
        
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
                var products = [subCatData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = subCatData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func prodects(subcategory_id: Int,completion: @escaping (_ error: Error?,_ sparParts: [prodectData]?)-> Void) {
        
        let url = URLs.products
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "subcategory_id": subcategory_id
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
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [prodectData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func similarProducts(product_id: Int,completion: @escaping (_ error: Error?,_ sparParts: [prodectData]?)-> Void) {
        
        let url = URLs.similarProducts
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "product_id": product_id
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
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [prodectData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func searchAPI(search: String,completion: @escaping (_ error: Error?,_ sparParts: [prodectData]?)-> Void) {
        
        let url = URLs.search
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "search": search
        ]
        print(parameters)
        let headers = [
            "X-localization": lang
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
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
                var products = [prodectData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func prodectIamges(type_id: Int,completion: @escaping (_ error: Error?,_ sparParts: [prodectImages]?)-> Void) {
        
        let url = URLs.Images
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters = [
            "type": "products",
            "type_id": type_id
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
                var products = [prodectImages]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectImages.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
