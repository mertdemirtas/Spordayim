//
//  UserProfileBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class UserProfileBuilder {
    class func build() -> UIViewController {
        let viewModel = UserProfileViewModel()
        let viewController = UserProfileViewController(viewModel: viewModel)
        viewController.title = "Profil"
        return viewController
    }
}

