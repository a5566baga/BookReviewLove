//
//  AppDelegate.swift
//  BookLove
//
//  Created by ben on 16/11/4.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let tabBarVC = UITabBarController()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            )
        let rankVC = UINavigationController(rootViewController: rankViewController())
        let searchVC = UINavigationController(rootViewController: searchViewController())
        let pushVC = UINavigationController(rootViewController: pushViewController())
        let moreVC = UINavigationController(rootViewController: moreViewController())
        let circleVC = UINavigationController(rootViewController: circleViewController())
        
        tabBarVC.viewControllers = [rankVC, searchVC, pushVC, circleVC, moreVC]
        
        let item1 = UITabBarItem(title: "排行榜", image: #imageLiteral(resourceName: "bio"), selectedImage: #imageLiteral(resourceName: "bio_red"))
        let item2 = UITabBarItem(title: "发现", image: #imageLiteral(resourceName: "timer 2"), selectedImage: #imageLiteral(resourceName: "timer 2_red"))
        let item3 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "pencil"), selectedImage: #imageLiteral(resourceName: "pencil_red"))
        let item4 = UITabBarItem(title: "圈子", image: #imageLiteral(resourceName: "users two-2"), selectedImage: #imageLiteral(resourceName: "users two-2_red"))
        let item5 = UITabBarItem(title: "更多", image: #imageLiteral(resourceName: "more"), selectedImage: #imageLiteral(resourceName: "more_ren"))
        
        rankVC.tabBarItem = item1
        searchVC.tabBarItem = item2
        pushVC.tabBarItem = item3
        circleVC.tabBarItem = item4
        moreVC.tabBarItem = item5
        
        tabBarVC.tabBar.tintColor = MAIN_COLOR
        
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

