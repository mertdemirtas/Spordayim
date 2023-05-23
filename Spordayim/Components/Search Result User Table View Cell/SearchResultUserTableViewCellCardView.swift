//
//  SearchResultUsersTableViewCellCardView.swift
//  Spordayim
//
//  Created by Mert Demirtas on 22.05.2023.
//

import UIKit

class SearchResultUserTableViewCellCardView: GenericBaseView<SearchResultUserTableViewCellData> {
    private lazy var containerView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.spacing = 10.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var profileImageView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imageView: ImageViewComponent = {
        let temp = ImageViewComponent()
        temp.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var userNameLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .black
        temp.font = .boldSystemFont(ofSize: 20)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        
        addSubview(containerView)
        containerView.addArrangedSubview(profileImageView)
        containerView.addArrangedSubview(userNameLabel)
        
        profileImageView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10.0),
            imageView.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 10.0),
            imageView.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -10.0),
            imageView.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -10.0),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        if let imageURLString = data.imageURLString { imageView.setImage(componentType: .fromURL(url: imageURLString)) }
        if let userName = data.userName { userNameLabel.text = userName }
    }
}
