//
//  LoginPageBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 24.03.2023.
//

import UIKit

class LoginPageBuilder {
    class func build() -> UIViewController {
        let viewModel = LoginPageViewModel()
        let viewController = LoginPageViewController(viewModel: viewModel)
        viewController.title = "Login Page"
        return viewController
    }
}
