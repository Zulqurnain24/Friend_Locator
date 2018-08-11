//
//  Friend.swift
//  
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class Friends: Codable {
    var friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}

class Friend: Codable {
    var longitude: String!
    var latitude: String!
    var picture: String!
    var _id:String!
    var name: String!
    var email: String!
    
    init(longitude:String, latitude:String, picture:String, _id:String!, name:String, email:String) {
        self._id = _id
        self.picture = picture
        self.name = name
        self.email = email
        self.longitude = longitude
        self.latitude = latitude
    }
    
    init() {
        self._id = ""
        self.picture = ""
        self.name = ""
        self.email = ""
        self.longitude = ""
        self.latitude = ""
    }
}
