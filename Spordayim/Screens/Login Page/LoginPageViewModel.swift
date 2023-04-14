//
//  LoginPageViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 24.03.2023.
//

import Foundation
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
    
    func auth(viewController: UIViewController?) {
        guard let viewController = viewController else { return }

        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { [unowned self] result, error in
          guard error == nil else {
            // ...
              return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            // ...
              return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

          // ...
            
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else { return }
                let rootViewController = MainMenuBuilder.build()
                let navigationController = UINavigationController(rootViewController: rootViewController)
                viewController.view.window?.rootViewController = navigationController
                viewController.view.window?.overrideUserInterfaceStyle = .light
                viewController.view.window?.makeKeyAndVisible()
              // At this point, our user is signed in
            }
        }
    }
}

