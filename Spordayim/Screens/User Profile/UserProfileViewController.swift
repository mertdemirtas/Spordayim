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
    
    private lazy var positionRatingsComponent: PositionRatingsComponent = {
        let temp = PositionRatingsComponent()
        temp.setData(by: PositionRatingsComponentData(goalKeeperStr: "Kalecilik Becerisi :", defenceStr: "Defans Becerisi :", midFielderStr: "Orta Saha Becerisi :" , strikerStr: "Forvet Becerisi :"))
        temp.isUserInteractionEnabled = false
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
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
    
    fileprivate func fillUserProfileInformation() {
        if let userProfileInformationData = viewModel.returnUserProfileInformationData() {
            userProfileInformationComponent.setData(by: userProfileInformationData)
        }
    }
    
    override func addViewComponents() {
        view.addSubview(userProfileInformationComponent)
        view.addSubview(positionRatingsComponent)
        

        NSLayoutConstraint.activate([
            userProfileInformationComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            userProfileInformationComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userProfileInformationComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            positionRatingsComponent.topAnchor.constraint(equalTo: userProfileInformationComponent.bottomAnchor),
            positionRatingsComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            positionRatingsComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension UserProfileViewController: UserProfileViewModelDelegate {
    func reloadData() {
        fillUserProfileInformation()
    }
}
