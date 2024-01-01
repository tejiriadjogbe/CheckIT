//
//  AppDelegate.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 30/12/2023.
//

import UIKit
import Utilities

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var coordinator: AppCoordinator?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCoordinator(application)
        UIFont.loadAllFonts()
        return true
    }

    private func setupCoordinator(_ application: UIApplication) {
        let navController = BaseNavigationController()
        coordinator = AppCoordinator(navigationController: navController, completion: nil)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

