//
//  ProfileInformationComponent.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class UserProfileInformationComponent: GenericBaseView<UserProfileInformationComponentData> {
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
        temp.layer.borderColor = UIColor.black.cgColor
        temp.layer.cornerRadius = 50.0
        temp.clipsToBounds = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var userNameLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.font = .systemFont(ofSize: 20)
        temp.tintColor = .black
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
        addSubview(containerView)
        addSubview(blackLine)
        
        containerView.addArrangedSubview(profileImageView)
        containerView.addArrangedSubview(verticalStackView)
        
        profileImageView.addSubview(profileImage)
        
        verticalStackView.addArrangedSubview(userNameLabel)
        verticalStackView.addArrangedSubview(userAgeLabel)
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 16.0),
            profileImage.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -16.0),
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: blackLine.topAnchor),
            
            blackLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            blackLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            blackLine.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        if let userImage = data.userProfileImage {
            profileImage.setImage(componentType: .fromURL(url: userImage))
        }
        
        if let userName = data.name {
            userNameLabel.text = userName
        }
        
        if let userAge = data.birthdayDate {
            userAgeLabel.text = userAge
        }
    }
}

