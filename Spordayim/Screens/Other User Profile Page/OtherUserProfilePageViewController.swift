//
//  OtherUserProfilePageViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import UIKit

class OtherUserProfilePageViewController: BaseViewController<OtherUserProfilePageViewModel> {

    
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
        fillUserProfileInformation()
    }
    
    override func addViewComponents() {
        view.addSubview(userProfileInformationComponent)

        NSLayoutConstraint.activate([
            userProfileInformationComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            userProfileInformationComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userProfileInformationComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            

        ])
    }
    
    fileprivate func fillUserProfileInformation() {
        if let userProfileInformationData = viewModel.returnUserProfileInformationData() {
            userProfileInformationComponent.setData(by: userProfileInformationData)
        }
    }
}

extension OtherUserProfilePageViewController: OtherUserProfilePageViewModelDelegate {
    func reloadData() {
        fillUserProfileInformation()

    }
}
