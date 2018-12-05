//
//  AppDelegate.swift
//  restaurant
//
//  Created by Samantha Owens on 6/24/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let restaurants: [Restaurant] = [
            Restaurant(n: "Be Our Guest", v: false, d: Destination.MagicKingdom, r: 1.0),
            Restaurant(n: "Gaston's Tavern", v: false, d: Destination.MagicKingdom, r: 1.0),
            Restaurant(n: "Yorkshire County Fish Shop", v: false, d: Destination.Epcot, r: 1.0),
            Restaurant(n: "Sommerfest", v: false, d: Destination.Epcot, r: 1.0),
            Restaurant(n: "Hollywood & Vine", v: false, d: Destination.HollywoodStudios, r: 1.0),
            Restaurant(n: "Sci-Fi Dine-In Theater Restaurant", v: false, d: Destination.HollywoodStudios, r: 1.0),
            Restaurant(n: "Yak & Yeti", v: true, d: Destination.AnimalKingdom, r: 1.0),
            Restaurant(n: "Rainforest Cafe", v: false, d: Destination.AnimalKingdom, r: 1.0)
        ]
        
        let realm = try! Realm()
        
        try! realm.write {
            restaurants.forEach { r in realm.create(Restaurant.self, value: r, update: true) }
        }
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
        // Saves changes in the application's managed object context before the application terminates.
    }
}

