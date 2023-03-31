//
//  AppSettingsViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import GoogleSignIn

class AppSettingsViewModel: BaseViewModel {
    
    
    public func signOut() -> Bool {
        do {
            try GIDSignIn.sharedInstance.signOut()
            return true
        }
        catch {
            return false
        }
    }
}
