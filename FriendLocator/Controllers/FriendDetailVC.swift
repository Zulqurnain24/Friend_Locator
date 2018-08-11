//
//  FriendDetailVC.swift
//
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import MapKit

class FriendDetailVC: UIViewController, UITextViewDelegate, MKMapViewDelegate {
  var friend = Friend()
  
  var friendDetailView: FriendDetailView {
    return view as! FriendDetailView
  }

  override func loadView() {
    title = "Your Friend"
    self.parent?.title = ""
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    let friendDetailView = FriendDetailView(frame: UIScreen.main.bounds)
    friendDetailView.name.text = "Name : \(friend.name!)"
    view = friendDetailView
    friendDetailView.map.delegate = self
    friendDetailView.map.addAnnotation(FriendCoordinate(name: friend.name, lat: Double(friend.latitude!)!, long: Double(friend.longitude!)!))
    let friendLocation = CLLocationCoordinate2D(latitude:  Double(friend.latitude!)!, longitude:  Double(friend.longitude!)!)
    friendDetailView.map.setCenter(friendLocation, animated: true)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    friendDetailView.hide()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    friendDetailView.unhide()
  }

  class func getViewController(friend: Friend) -> FriendDetailVC {
    let friendDetailVC = FriendDetailVC()
    friendDetailVC.friend = friend
    return friendDetailVC
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {

  }
}
