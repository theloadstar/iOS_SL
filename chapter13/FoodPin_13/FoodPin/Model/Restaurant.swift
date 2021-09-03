//
//  Restaurant.swift
//  FoodPin
//
//  Created by Ember on 2021/9/3.
//  Copyright © 2021 Ember. All rights reserved.
//

import Foundation

class Restaurant {
    var name : String
    var type : String
    var location : String
    var image : String
    var isVisited : Bool
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
    
    convenience init(){
        self.init(name: "", type: "", location: "", image: "", isVisited: false)
    }
}
