//
//  FriendCell.swift
//
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

  private var name: UILabel = {
    let name = UILabel()
    name.textColor = Colors.blackish
    name.font = Fonts.body
    name.enableAutoLayout()
    return name
  } ()
    
  internal static let thumbnailHeightWidth: CGFloat = 70.0

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = Colors.white
    addSubview(name)
    name.leadingAnchor.constraint(equalTo: (self.imageView?.trailingAnchor)!, constant: Padding.standard).activate()
    name.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    name.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
  }

  internal func configure(picture:String,  name: String, email:String, longitude:String, latitude:String) {
    self.name.text = name
    self.imageView?.imageFromServerURL(urlString: picture)
  }
}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "Error downloading image")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
    
}
