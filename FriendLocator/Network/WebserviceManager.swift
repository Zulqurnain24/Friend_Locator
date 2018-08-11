//
//  ViewController.swift
//  JSONDownloadingSwift4
//
//  Created by Mohammad Zulqurnain on 10/08/2018.
//  Copyright 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class WebserviceManager: NSObject {
    final let url = URL(string: "\(baseUrl)\(Endpoint.friends.rawValue)")
    var friends = [Friend]()

    func downloadJson(completion: @escaping ([Friend])->Void) {
        guard let downloadURL = url else { return }

        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            
            do
            {
                let friednsJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [Any]

                for friend in friednsJson as! [AnyObject] {
                    self.friends.append(Friend(longitude: "\(((friend["location"] as! NSDictionary)["longitude"])!)", latitude: "\(((friend["location"] as! NSDictionary)["latitude"])!)" , picture: (friend["picture"]) as! String, _id: (friend["_id"]) as! String, name: (friend["name"]) as! String, email: (friend["email"]) as! String))
                }

                completion(self.friends)
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
    }
}

