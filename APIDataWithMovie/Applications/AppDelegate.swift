//
//  AppDelegate.swift
//  APIDataWithMovie
//
//  Created by Aung Kyaw Phyo on 20/01/2025.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// InitialViewController
        let initialViewController = DesignableTabBarViewController.instantiate(storyboard: .base)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        return true
    }

}

