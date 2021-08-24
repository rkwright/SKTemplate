//
//  AppDelegate.swift
//
//  Created by Roger Boesch on 12/07/16.
//  Copyright © 2016 Roger Boesch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var _window: UIWindow?
    private var _viewController: ViewController?
    
    // ------------------------------------------------------------------------------

    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        _viewController = ViewController()
        
        _window = UIWindow(frame: UIScreen.main.bounds)
        _window?.rootViewController = _viewController
        _window?.makeKeyAndVisible()
    }

    // ------------------------------------------------------------------------------

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}

    // ------------------------------------------------------------------------------

}

