//
//  AppDelegate.swift
//
//  Created by Mike MacDougall on 12/8/16.
//  Copyright © 2016 Etsy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        let viewController = ViewController()
        let navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        return true
    }
}

