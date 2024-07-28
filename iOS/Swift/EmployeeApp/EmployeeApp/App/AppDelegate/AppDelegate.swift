//
//  AppDelegate.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseCore
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        
        App.shared.bootstrap(with: application, launchOptions: launchOptions)
        
        IQKeyboardManager.shared.enable = true
        
        presentRootVC()
        
        return true
    }
    
    func presentRootVC() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = T.color.neutralsBackground
        window.tintColor = T.color.primariesDefault

        self.window = window

        let windowRouter = WindowRouter(window: window)
        appCoordinator = AppCoordinator(windowRouter: windowRouter)
        appCoordinator.start()
        
        window.makeKeyAndVisible()
    }
}

