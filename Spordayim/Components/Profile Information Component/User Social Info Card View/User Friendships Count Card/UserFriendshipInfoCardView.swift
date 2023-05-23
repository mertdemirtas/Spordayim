//
//  UserFriendShipInfoCardView.swift
//  Spordayim
//
//  Created by Mert Demirtas on 23.05.2023.
//

import UIKit

class UserFriendShipInfoCardView: GenericBaseView<UserFriendShipInfoCardViewData> {
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 4.0
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var followersCountLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .black
        temp.font = .boldSystemFont(ofSize: 17)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var followersTitle: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .darkGray
        temp.font = .systemFont(ofSize: 15)
        temp.text = "Arkadas"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(followersCountLabel)
        containerStackView.addArrangedSubview(followersTitle)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        followersCountLabel.text = "\(data.followersCount ?? 0)"
    }
}
