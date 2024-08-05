//
//  AppDelegate.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        App.shared.bootstrap(with: application, launchOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = R.storyboard.randomUsers.randomUsersController()!
        vc.viewModel = RandomUsersViewModel()
        
        
        let nc = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
}

