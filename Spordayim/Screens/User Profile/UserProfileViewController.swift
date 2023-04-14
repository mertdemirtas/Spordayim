//
//  UserProfileViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class UserProfileViewController: BaseViewController<UserProfileViewModel> {
    private lazy var navigationBarSettingsButton: NavigationBarSettingsButton = {
        let temp = NavigationBarSettingsButton()
        temp.setButtonAction { [weak self] in
            let vc = AppSettingsBuilder.build()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var userProfileInformationComponent: UserProfileInformationComponent = {
        let temp = UserProfileInformationComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        prepareNavigationBarItems()
        fillUserProfileInformation()
    }
    
    private func prepareNavigationBarItems() {
        let rightBarItem = UIBarButtonItem(customView: navigationBarSettingsButton)
        self.navigationItem.setRightBarButton(rightBarItem, animated: true)
    }
    
    private func fillUserProfileInformation() {
        if let userProfileInformationData = viewModel.returnUserProfileInformationData() {
            userProfileInformationComponent.setData(by: userProfileInformationData)
        }
    }
    
    override func addViewComponents() {
        view.addSubview(userProfileInformationComponent)
        
        NSLayoutConstraint.activate([
            userProfileInformationComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userProfileInformationComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userProfileInformationComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userProfileInformationComponent.heightAnchor.constraint(equalToConstant: 200.0)
        ])
    }
}
