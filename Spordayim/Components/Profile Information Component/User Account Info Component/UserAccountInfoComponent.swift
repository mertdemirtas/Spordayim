//
//  UserAccountInfoComponent.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import UIKit

class UserAccountInfoComponent: GenericBaseView<UserAccountInfoComponentData> {
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.spacing = 5.0
        temp.axis = .vertical
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var userNameLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .black
        temp.font = .boldSystemFont(ofSize: 24)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var mainPositionLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .gray
        temp.font = .systemFont(ofSize: 15)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var cityInfoLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .gray
        temp.font = .systemFont(ofSize: 15)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(userNameLabel)
        containerStackView.addArrangedSubview(mainPositionLabel)
        containerStackView.addArrangedSubview(cityInfoLabel)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        if let userName = data.userName {
            userNameLabel.text = userName
        }
        
        if let mainPosition = data.mainPosition {
            mainPositionLabel.text = mainPosition
        }
        
        if let cityInfo = data.cityInfo {
            cityInfoLabel.text = cityInfo
        }
    }
}
