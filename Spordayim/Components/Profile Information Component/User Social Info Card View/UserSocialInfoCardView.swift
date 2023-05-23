//
//  UserSocialInfoCardView.swift
//  Spordayim
//
//  Created by Mert Demirtas on 22.05.2023.
//

import UIKit

class UserSocialInfoCardView: GenericBaseView<UserSocialInfoCardViewData> {
    private lazy var containerView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fillEqually
        temp.spacing = 20.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var userFriendshipInfo: UserFriendShipInfoCardView = {
        let temp = UserFriendShipInfoCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var friendshipStatus: FriendShipStatusInfoCard = {
        let temp = FriendShipStatusInfoCard()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerView)
        
        containerView.addArrangedSubview(userFriendshipInfo)
        containerView.addArrangedSubview(friendshipStatus)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        userFriendshipInfo.setData(by: UserFriendShipInfoCardViewData(followersCount: data.numberOfFriends))
        friendshipStatus.setData(by: FriendshipStatusInfoCardData(friendshipStatus: data.friendShipStatus ?? .accountHolder))
    }
}
