//
//  UserProfileViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import FirebaseAuth

class UserProfileViewModel: BaseViewModel {
    private var userProfileInformationData: UserProfileInformationComponentData?
    
    override init() {
        super.init()
        self.userProfileInformationData = getUserProfileInformations() ?? nil
    }
    
    private func getUserProfileInformations() -> UserProfileInformationComponentData? {
        guard let user = Auth.auth().currentUser else { return nil }
        
        let profileInformationData = UserProfileInformationComponentData(name: user.displayName, userProfileImage: user.photoURL?.absoluteString ?? "", birthdayDate: "05.06.1999")
        
        return profileInformationData
    }
    
    public func returnUserProfileInformationData() -> UserProfileInformationComponentData? {
        guard let userProfileInformationData = userProfileInformationData else { return nil }
        return userProfileInformationData
    }
}
