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
    
    private var credential: AuthCredential?
    private var data: CitySelectionData?
    
    override init() {
        super.init()
    }
    
    func getData() -> CitySelectionData? {
        guard let data = self.data else { return nil }
        return data
    }
    
    func getCredential() -> AuthCredential? {
        guard let credential = self.credential else { return nil }
        return credential
    }
    
    func authUser(viewController: UIViewController?, completion: @escaping () -> Void) {
        guard let viewController = viewController else { return }
        
        
        auth(viewController: viewController, completion: { [weak self] in
            completion()
            
            /*
            let homePage = TabBarControllerViewControllerData(viewController: MainMenuBuilder.build(), tabBarControllerImageName: "house")
            
            let settingsPage = TabBarControllerViewControllerData(viewController: SearchScreenBuilder.build(), tabBarControllerImageName: "magnifyingglass")
            
            let profilePage = TabBarControllerViewControllerData(viewController: UserProfileBuilder.build(), tabBarControllerImageName: "person")
            
            let tabBarData = TabBarControllerComponentData(items: [homePage, settingsPage, profilePage])
            
            let tabBar = TabBarComponent(with: tabBarData)
            
            viewController.view.window?.rootViewController = tabBar
            viewController.view.window?.overrideUserInterfaceStyle = .light
            viewController.view.window?.makeKeyAndVisible()
             */
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
            self.credential = credential
            
            fireBaseManager.authUser(with: credential) { [weak self] uid in
                guard let userFullname = user.profile?.name else { return }
                guard let userEmail = user.profile?.email else { return }
                let temp = CitySelectionData(name: userFullname, uid: uid, email: userEmail, credential: credential)
                self?.data = temp
                completion()
            }
        }
    }
}


