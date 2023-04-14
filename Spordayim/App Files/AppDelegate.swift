//
//  AppDelegate.swift
//  Spordayim
//
//  Created by Mert Demirtas on 24.03.2023.
//

import UIKit
import FirebaseCore
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // 853012084257-kc3a9bjpsaj46tfi96dmmc075d3p7ig2.apps.googleusercontent.com
    var window: UIWindow?
    static let signInConfig = GIDConfiguration(clientID: "853012084257-kc3a9bjpsaj46tfi96dmmc075d3p7ig2.apps.googleusercontent.com")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                self.window = UIWindow()
                let rootViewController = LoginPageBuilder.build()
                let navigationController = UINavigationController(rootViewController: rootViewController)
                self.window?.rootViewController = navigationController
                self.window?.overrideUserInterfaceStyle = .light
                self.window?.makeKeyAndVisible()
            }
            
            else {
                let homePage = TabBarControllerViewControllerData(viewController: MainMenuBuilder.build(), tabBarControllerImageName: "house")
                
                let settingsPage = TabBarControllerViewControllerData(viewController: SearchScreenBuilder.build(), tabBarControllerImageName: "magnifyingglass")
                
                let profilePage = TabBarControllerViewControllerData(viewController: UserProfileBuilder.build(), tabBarControllerImageName: "person")
                
                let tabBarData = TabBarControllerComponentData(items: [homePage, settingsPage, profilePage])
                
                let tabBar = TabBarComponent(with: tabBarData)
                
                self.window = UIWindow()
                self.window?.rootViewController = tabBar
                self.window?.overrideUserInterfaceStyle = .light
                self.window?.makeKeyAndVisible()
            }
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

