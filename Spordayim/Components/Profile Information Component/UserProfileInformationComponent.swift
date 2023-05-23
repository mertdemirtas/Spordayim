//
//  ProfileInformationComponent.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class UserProfileInformationComponent: GenericBaseView<UserProfileInformationComponentData> {
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 20.0
        temp.distribution = .fillProportionally
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    private lazy var containerView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.spacing = 10.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.distribution = .fillEqually
        temp.spacing = 8.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var profileImageView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var profileImage: ImageViewComponent = {
        let temp = ImageViewComponent()
        temp.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temp.layer.borderWidth = 1.0
        temp.layer.masksToBounds = false
        temp.layer.borderColor = UIColor.darkGray.cgColor
        temp.layer.cornerRadius = 50.0
        temp.clipsToBounds = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var accountInfo: UserAccountInfoComponent = {
        let temp = UserAccountInfoComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var socialInfo: UserSocialInfoCardView = {
        let temp = UserSocialInfoCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var userAgeLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.font = .systemFont(ofSize: 20)
        temp.tintColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var blackLine: BaseView = {
        let temp = BaseView()
        temp.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        temp.backgroundColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        addSubview(blackLine)
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(accountInfo)
        stackView.addArrangedSubview(socialInfo)
        
        profileImageView.addSubview(profileImage)

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            
            profileImage.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),

        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        if let userImage = data.userProfileInfoData?.profileImage {
            profileImage.setImage(componentType: .fromURL(url: userImage))
        }
        
        let cityInfo = "\(data.userProfileInfoData?.city ?? ""), \(data.userProfileInfoData?.district ?? "")"
        accountInfo.setData(by: UserAccountInfoComponentData(userName: data.userProfileInfoData?.name, mainPosition: data.userProfileInfoData?.mainRole, cityInfo: cityInfo))
        
        socialInfo.setData(by: data.socialInfo)
        
        if let userAge = data.userProfileInfoData?.birthdayDate {
            userAgeLabel.text = userAge
        }
    }
}

