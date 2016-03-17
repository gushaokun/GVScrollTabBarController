//
//  AppDelegate.swift
//  GVScrollTabBarController
//
//  Created by Gavin on 16/3/17.
//  Copyright © 2016年 Gavin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.whiteColor()
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.title = "vc1"
        vc1.title = "vc1"
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.yellowColor()
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.title = "vc2"
        vc2.title = "vc2"
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.redColor()
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.title = "vc3"
        vc3.title = "vc3"
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.blueColor()
        let nav4 = UINavigationController(rootViewController: vc4)
        nav4.title = "vc4"
        vc4.title = "vc4"
        
        let tabBarVC = GVScrollTabBarController()
        
        tabBarVC.viewControllers = [nav1,nav2,nav3,nav4]
        
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

