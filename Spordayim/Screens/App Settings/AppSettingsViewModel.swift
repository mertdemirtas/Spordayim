//
//  AppSettingsViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import GoogleSignIn
import FirebaseAuth

class AppSettingsViewModel: BaseViewModel {
    
    
    public func signOut() -> Bool {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance.signOut()
            return true
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            return false
        }
    }
}
