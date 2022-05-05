//
//  AppDelegate.swift
//  SampleAnimation
//
//  Created by Makoto on 2022/05/04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let storyboard = UIStoryboard(name: "Initial", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "InitialViewController")
        window?.rootViewController = rootViewController
        return true
    }
}

