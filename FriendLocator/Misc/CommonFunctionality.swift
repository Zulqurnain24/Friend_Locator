//
//  CommonFunctionality.swift
//  FriendLocator
//
//  Created by Mohammad Zulqurnain on 10/08/2018.
//  Copyright 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class CommonFunctionality {
    
    static func presentAlert(viewController:UIViewController, title:String, message:String, callbackOnAffirmation: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:
            { alertViewAction in
            callbackOnAffirmation()
                
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        viewController.present(alert, animated: true)
    }
}
