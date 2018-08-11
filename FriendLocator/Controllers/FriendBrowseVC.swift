//
//  FriendBrowseVC.swift
//
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class FriendBrowseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  private let webserviceManager = WebserviceManager()

  var friendBrowseView: FriendBrowseView {
    view.backgroundColor = Colors.lightGray
    return view as! FriendBrowseView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    //friendBrowseView.frame = self.view.frame
 }
    
  override func loadView() {
    view = FriendBrowseView(frame: UIScreen.main.bounds)
    title = "All Friends"
    friendBrowseView.setupTable(dataSource: self, delegate: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    friendBrowseView.isHidden = false
    guard Reachability.isConnectedToNetwork() else {
        CommonFunctionality.presentAlert(viewController: self, title: "Error", message: "Please connect to internet.", callbackOnAffirmation:({ 
            self.callWebService()
            
        }))
        return
    }
    callWebService()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return webserviceManager.friends.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = friendBrowseView.table.dequeueReusableCell(withIdentifier: "\(FriendCell.self)") as! FriendCell
    let friend = webserviceManager.friends[indexPath.row]
    cell.configure(picture:friend.picture, name: friend.name, email: friend.email, longitude:friend.longitude, latitude:friend.latitude)
    cell.layoutMargins = .zero // remove table cell separator margin
    cell.contentView.layoutMargins.left = 5 // set up left margin to 20
    cell.contentView.layoutMargins.right = 5
    cell.contentView.layoutMargins.top = 5
    cell.contentView.layoutMargins.bottom = 5
    cell.contentView.backgroundColor = Colors.lightGray
    cell.backgroundColor = Colors.lightGray
    
    let whiteRoundedView : UIView = UIView(frame: CGRect(x:5, y:5, width:cell.frame.size.width + 18, height:FriendCell.thumbnailHeightWidth - 5))
    whiteRoundedView.layer.borderColor = Colors.blackish.cgColor
     whiteRoundedView.layer.borderWidth = 1.0
    whiteRoundedView.layer.backgroundColor = Colors.white.cgColor
    whiteRoundedView.layer.masksToBounds = false
    
    cell.contentView.addSubview(whiteRoundedView)
    cell.contentView.sendSubview(toBack: whiteRoundedView)
    
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return FriendCell.thumbnailHeightWidth
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    let friendDetailVC = FriendDetailVC.getViewController(friend: webserviceManager.friends[indexPath.row])
    friendBrowseView.isHidden = true
    navigationController?.pushViewController(friendDetailVC, animated: true)
  }
    
  func callWebService() {
        webserviceManager.downloadJson(completion:{ friends in
            self.webserviceManager.friends = friends
            DispatchQueue.main.async {
                self.friendBrowseView.table.reloadData()
            }
            print("Completion handler called!")
        })
  }
}
