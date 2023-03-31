//
//  NavigationBarSettingsButton.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class NavigationBarSettingsButton: BaseButton<NavigationBarSettingsButtonData> {
    
    private lazy var imageView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var settingsImage: UIImageView = {
        let temp = UIImageView()
        temp.tintColor = .white
        temp.image = UIImage(systemName: "gear")
        temp.heightAnchor.constraint(equalToConstant: 30).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 30).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(imageView)
        
        imageView.addSubview(settingsImage)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            settingsImage.topAnchor.constraint(equalTo: imageView.topAnchor),
            settingsImage.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            settingsImage.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            settingsImage.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
        ])
    }
}
