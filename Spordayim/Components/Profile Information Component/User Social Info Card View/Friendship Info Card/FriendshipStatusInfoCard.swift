//
//  FriendshipInfoCard.swift
//  Spordayim
//
//  Created by Mert Demirtas on 23.05.2023.
//

import UIKit

class FriendShipStatusInfoCard: GenericBaseView<FriendshipStatusInfoCardData> {
    private lazy var friendShipButton: ProfileFriendshipRequestButton = {
        let temp = ProfileFriendshipRequestButton()
        temp.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(friendShipButton)
        
        NSLayoutConstraint.activate([
            friendShipButton.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            friendShipButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            friendShipButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        friendShipButton.setData(by: FriendshipStatusInfoCardData(friendshipStatus: data.friendshipStatus))
    }
}
