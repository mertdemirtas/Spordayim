//
//  LoginPageViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 24.03.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginPageViewModel: BaseViewModel {
    
    override init() {
        super.init()
        deneme()
    }
    
    func deneme() {
        
    }
    
    func authUser(viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        
        auth(viewController: viewController, completion: { [weak self] in
            let homePage = TabBarControllerViewControllerData(viewController: MainMenuBuilder.build(), tabBarControllerImageName: "house")
            
            let settingsPage = TabBarControllerViewControllerData(viewController: SearchScreenBuilder.build(), tabBarControllerImageName: "magnifyingglass")
            
            let profilePage = TabBarControllerViewControllerData(viewController: UserProfileBuilder.build(), tabBarControllerImageName: "person")
            
            let tabBarData = TabBarControllerComponentData(items: [homePage, settingsPage, profilePage])
            
            let tabBar = TabBarComponent(with: tabBarData)
            
            viewController.view.window?.rootViewController = tabBar
            viewController.view.window?.overrideUserInterfaceStyle = .light
            viewController.view.window?.makeKeyAndVisible()
        })


    }
    
    private func auth(viewController: UIViewController?, completion: @escaping () -> Void) {
        let fireBaseManager = FirebaseMaganer()
        
        guard let viewController = viewController else { return }
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            guard error == nil else {
                // ...
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            fireBaseManager.authUser(with: credential) { err in
                guard err == nil else { return }
                completion()
            }
        }
    }
}


