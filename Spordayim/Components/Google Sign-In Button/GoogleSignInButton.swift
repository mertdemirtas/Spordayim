//
//  GoogleSignInButton.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class GoogleSignInButton: BaseButton<SignInButtonData> {
    
    private let stackViewHorizontalSpacingValue: CGFloat = 10.0
    
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.alignment = .fill
        temp.axis = .horizontal
        temp.layer.borderColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        temp.layer.borderWidth = 1
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.spacing = stackViewHorizontalSpacingValue
        temp.backgroundColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imageView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var signInImage: UIImageView = {
        let temp = UIImageView()
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 40).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var labelView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var signInButtonLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .black
        temp.font = .systemFont(ofSize: 18)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(labelView)
        
        imageView.addSubview(signInImage)
        labelView.addSubview(signInButtonLabel)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            signInImage.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8.0),
            signInImage.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 8.0),
            signInImage.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8.0),
            signInImage.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8.0),
            
            signInButtonLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            signInButtonLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -10.0),
            signInButtonLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        if let signInImage = data.image {
            self.signInImage.image = UIImage(named: signInImage)
        }
        
        if let signInText = data.signInText {
            self.signInButtonLabel.text = signInText
        }
    }
}

