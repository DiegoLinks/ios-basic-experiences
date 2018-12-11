//
//  AppDelegate.swift
//  CicloDeVida
//
//  Created by Fourtime on 11/12/18.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        print("############ didFinishLaunchingWithOptions")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("############ applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(applicationDidEnterBackground)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("############ applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("############ applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("############ applicationWillTerminate")
    }


}

