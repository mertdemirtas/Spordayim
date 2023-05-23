//
//  OtherUserProfilePageViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import Foundation
import FirebaseAuth

protocol OtherUserProfilePageViewModelDelegate: AnyObject {
    func reloadData()
}

class OtherUserProfilePageViewModel: BaseViewModel {
    weak var delegate: OtherUserProfilePageViewModelDelegate?
    
    private var userProfileInformationData: UserProfileInformationComponentData?
    private var fireBaseManager = FirebaseMaganer()
    private let currentUserUID = Auth.auth().currentUser?.uid
    private let userUID: String
    
    init(userUID: String) {
        self.userUID = userUID
        super.init()
        self.userProfileInformationData = getUserProfileInformations()

    }
    
    private func getUserProfileInformations() -> UserProfileInformationComponentData? {
        guard let currentUser = Auth.auth().currentUser else { return nil }
        var profileData: UserProfileFirebaseData?
        var socialInfoData: UserSocialInfoCardViewData?
        
        fireBaseManager.getUserData(userUID: userUID, completion: { [weak self] result in
            switch result {
            case .success(let data):
                profileData = data
                
                self?.fireBaseManager.getFriendShips(userUID: self?.userUID, completion: { [weak self] result in
                    switch result {
                        
                    case .success(let data):
                        var friendshipStatus: FriendshipStatusInfoEnum?
                        
                        let numberOfFriends = data.friendships.count
                        if data.friendships.keys.contains(currentUser.uid) {
                            if data.friendships[currentUser.uid]!.friendshipStatus { friendshipStatus = .friend }
                            else { friendshipStatus = .friendshipRequested }
                        }
                        
                        else { friendshipStatus = .notFriend }
                        
                        socialInfoData = UserSocialInfoCardViewData(numberOfFriends: numberOfFriends, friendShipStatus: friendshipStatus)
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
