//
//  AppDelegate.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/20.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        sleep(3)
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = WBMainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

