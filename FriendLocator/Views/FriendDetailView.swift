//
//  FriendDetailView.swift
//  
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import MapKit

class FriendDetailView: UIView, CLLocationManagerDelegate  {
 
    internal let distanceSpan: Double = 500
    internal let regionRadius: Double = 500
    internal var locationManager: CLLocationManager? = {
        let locationManager = CLLocationManager()
        return locationManager
    } ()
    
    internal var map: MKMapView = {
        let mapView = MKMapView()
        mapView.backgroundColor = Colors.white
        mapView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 250, height: 100))
        mapView.enableAutoLayout()
        return mapView
    } ()
    
    internal var imageView: UIImageView = {
        var image = UIImage(named: "friendPic.png")
        var imageView = UIImageView(image: image)
        imageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 45, height: 45))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Colors.reddish
        imageView.enableAutoLayout()
        return imageView
    } ()

    internal var name: UILabel = {
        let name = UILabel()
        name.textColor = Colors.blackish
        name.backgroundColor = UIColor.white
        name.font = Fonts.subheading
        name.lineBreakMode = .byWordWrapping
        name.numberOfLines = 0
        name.enableAutoLayout()
        return name
    } ()

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Colors.white
    addSubview(map)
    addSubview(imageView)
    addSubview(name)

    setUpLocationManager()
    setConstraints()
  }

  func setUpLocationManager() {
        
        locationManager = CLLocationManager()
        
        if let locationManager = locationManager {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
        }
  }
    
  func setConstraints() {
        map.topAnchor.constraint(equalTo: (self.topAnchor), constant: 0).activate()
        map.bottomAnchor.constraint(equalTo: name.topAnchor, constant: -Padding.standard).activate()
        map.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 2).activate()
        map.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 2).activate()
        map.widthAnchor.constraint(equalTo: (self.widthAnchor), constant: -(0.1 * ScreenDimensions.width)).activate()
        map.heightAnchor.constraint(equalTo: (self.heightAnchor), constant: -(0.4 * ScreenDimensions.height)).activate()
        
        imageView.topAnchor.constraint(equalTo: map.bottomAnchor, constant: Padding.standard).activate()
        imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: Padding.standard/8).activate()
        imageView.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -Padding.standard/2).activate()
    
        name.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 0).activate()
        name.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()

  }
    
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                              regionRadius, regionRadius)
    map.setRegion(coordinateRegion, animated: true)
  }
    
  func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
    if let mapView = self.map as? MKMapView {
            let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, self.distanceSpan, self.distanceSpan)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
  }

  internal func hide() {
    map.isHidden = true
  }

  internal func unhide() {
    map.isHidden = false

  }
}
