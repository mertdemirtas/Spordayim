//
//  ProfileFriendshipRequestButton.swift
//  Spordayim
//
//  Created by Mert Demirtas on 23.05.2023.
//

import UIKit

class ProfileFriendshipRequestButton: BaseButton<FriendshipStatusInfoCardData> {
    private lazy var buttonView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    func addView() {
        addSubview(buttonView)
        buttonView.backgroundColor = .blue
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: topAnchor),
            buttonView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        switch (data.friendshipStatus) {
            
        case .accountHolder:
            addView()
        case .notFriend:
            addView()
        case .friend:
            addView()
        case .friendshipRequested:
            addView()
        }
    }
}
