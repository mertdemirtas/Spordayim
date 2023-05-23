//
//  UserProfileViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import FirebaseAuth

protocol UserProfileViewModelDelegate: AnyObject {
    func reloadData()
}

class UserProfileViewModel: BaseViewModel {
    private var userProfileInformationData: UserProfileInformationComponentData?
    private var fireBaseManager = FirebaseMaganer()
    weak var delegate: UserProfileViewModelDelegate?
    
    override init() {
        super.init()
        self.userProfileInformationData = getUserProfileInformations() ?? nil
    }
    
    private func getUserProfileInformations() -> UserProfileInformationComponentData? {
        guard let user = Auth.auth().currentUser else { return nil }
        var profileData: UserProfileFirebaseData?
        var socialInfoData: UserSocialInfoCardViewData?
        
        fireBaseManager.getUserData(userUID: user.uid, completion: { [weak self] result in
            switch result {
            case .success(let data):
                profileData = data
                
                self?.fireBaseManager.getFriendShips(userUID: user.uid, completion: { [weak self] result in
                    switch result {
                    case .success(let data):
                        let numberOfFriends = data.friendships.count
                        socialInfoData = UserSocialInfoCardViewData(numberOfFriends: numberOfFriends, friendShipStatus: .accountHolder)
                        self?.userProfileInformationData = UserProfileInformationComponentData(userProfileInfoData: profileData, socialInfo: socialInfoData)
                        self?.delegate?.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                })
            
            case .failure(let error):
                print(error)
            }
        })
        return userProfileInformationData
    }
    
    public func returnUserProfileInformationData() -> UserProfileInformationComponentData? {
        guard let userProfileInformationData = userProfileInformationData else { return nil }
        return userProfileInformationData
    }
}
