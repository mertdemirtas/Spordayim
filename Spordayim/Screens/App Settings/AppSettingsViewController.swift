//
//  AppSettingsViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class AppSettingsViewController: BaseViewController<AppSettingsViewModel> {
    
    private lazy var signOutButton: BaseButton<GenericDataProtocol> = {
        let temp = BaseButton<GenericDataProtocol>()
        
        let label = BaseLabel()
        label.text = "Sign Out"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        
        temp.backgroundColor = .red
        temp.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10.0
        temp.addViewOnCenter(view: label)
        
        temp.setButtonAction { [weak self] in
            if self?.viewModel.signOut() ?? false {
                let rootViewController = LoginPageBuilder.build()
                let navigationController = UINavigationController(rootViewController: rootViewController)
                self?.view.window?.rootViewController = navigationController
                self?.view.window?.overrideUserInterfaceStyle = .light
                self?.view.window?.makeKeyAndVisible()
            }
            else {
                
            }
        }
        
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addViewComponents() {
        view.addSubview(signOutButton)
        
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
