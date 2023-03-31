//
//  LoginPageViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 24.03.2023.
//

import Foundation
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
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signInResult, error in
            guard error == nil else { return }
            let rootViewController = MainMenuBuilder.build()
            let navigationController = UINavigationController(rootViewController: rootViewController)
            viewController.view.window?.rootViewController = navigationController
            viewController.view.window?.overrideUserInterfaceStyle = .light
            viewController.view.window?.makeKeyAndVisible()
        }
    }
}

