//
//  homeData.swift
//  Nazareth
//
//  Created by Farido on 9/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class homeData: NSObject {

    
    var name: String
    var image: String
    var descript: String
    var id: Int
    
    
    init?(dict: [String: JSON]){
        
        guard let name = dict["name"]?.string,let descript = dict["description"]?.string,let image = dict["image"]?.string,let id = dict["id"]?.int else {return nil}
        self.name = name
        self.image = image
        self.id = id
        self.descript = descript
        
    }
    
}

class subCatData: NSObject {

    var name: String
    var category_id: String
    var id: Int
    
    
    init?(dict: [String: JSON]){
        
        guard let name = dict["name"]?.string,let category_id = dict["category_id"]?.string,let id = dict["id"]?.int else {return nil}
        self.name = name
        self.id = id
        self.category_id = category_id
        
    }
    
}


class prodectImages: NSObject {
    
    var image: String
    var id: Int
    
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string,let id = dict["id"]?.int else {return nil}
        self.image = image
        self.id = id
        
    }
    
}



class prodectData: NSObject {
    
    
    var id: Int
    var name: String
    var descript: String
    var lng: String
    var lat: String
    var subcategory_id: String
    var total_rate: Int
    var average_rating: Double
    var image: String
    var address: String
    var bookable: String

    
    init?(dict: [String: JSON]){
        
        if let average_rating = dict["average_rating"]?.double {
            self.average_rating = average_rating
        }else {
            self.average_rating = 0.0
        }
        
        if let total_rate = dict["total_rate"]?.int {
            self.total_rate = total_rate
        }else {
            self.total_rate = 0
        }
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let descript = dict["description"]?.string,let lng = dict["lng"]?.string,let lat = dict["lat"]?.string,let subcategory_id = dict["subcategory_id"]?.string,let image = dict["image"]?.string,let address = dict["address"]?.string,let bookable = dict["bookable"]?.string else {return nil}
        
        self.id = id
        self.name = name
        self.descript = descript
        self.lng = lng
        self.lat = lat
        self.subcategory_id = subcategory_id
        self.image = image
        self.address = address
        self.bookable = bookable
        
    }
    
}


class event: NSObject {

    var title: String
    var image: String
    var descript: String
    var short_description: String
    var date_time: String
    
    
    
    
    init?(dict: [String: JSON]){
        
        if let date_time = dict["date_time"]?.string {
            self.date_time = date_time
        }else {
            self.date_time = ""
        }
        
        
        
        guard let title = dict["title"]?.string,let image = dict["image"]?.string,let descript = dict["description"]?.string,let short_description = dict["short_description"]?.string else {return nil}
        
        
        self.title = title
        self.image = image
        self.descript = descript
        self.short_description = short_description
    }
    
}


class reviewsData: NSObject {

    var comment: String
    var email: String
    var name: String
    var review: String
    var created_at: String
    
    
    init?(dict: [String: JSON]){
        
        
        
        guard let comment = dict["comment"]?.string,let email = dict["email"]?.string,let name = dict["name"]?.string,let review = dict["review"]?.string,let created_at = dict["created_at"]?.string else {return nil}
        
        
        self.comment = comment
        self.email = email
        self.name = name
        self.review = review
        self.created_at = created_at
    }
    
}
