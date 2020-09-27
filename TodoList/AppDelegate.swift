//
//  AppDelegate.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    let navController = UINavigationController(rootViewController: ListViewController())
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    CoreDataManager.shared.saveContext()
  }
}

