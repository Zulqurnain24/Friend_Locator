//
//  AppDelegate.swift
//
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Colors.changeDefaults()
        UIApplication.shared.isStatusBarHidden = false
        window = UIWindow(frame: UIScreen.main.bounds)
        let friendBrowseNavC = UINavigationController(rootViewController: FriendBrowseVC())
        friendBrowseNavC.navigationBar.barTintColor = Colors.white
        friendBrowseNavC.navigationBar.tintColor = Colors.reddish
        friendBrowseNavC.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        window?.rootViewController = friendBrowseNavC
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
}
