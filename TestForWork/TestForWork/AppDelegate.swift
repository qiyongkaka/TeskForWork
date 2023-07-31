//
//  AppDelegate.swift
//  TestForWork
//
//  Created by ByteDance on 2023/7/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        window?.rootViewController = ViewController()
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()
        return true
    }


}

