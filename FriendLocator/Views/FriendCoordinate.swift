//
//  FriendAnnotation.swift
//  FriendLocator
//
//  Created by Mohammad Zulqurnain on 10/08/2018.
//  Copyright 2018 Mohammad Zulqurnain. All rights reserved.
//
import UIKit
import MapKit

class FriendCoordinate: NSObject, MKAnnotation{
    var identifier = "friend location"
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init(name:String, lat:CLLocationDegrees, long:CLLocationDegrees){
        title = name
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}
