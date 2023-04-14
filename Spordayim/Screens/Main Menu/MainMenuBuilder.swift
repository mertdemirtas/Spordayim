//
//  MainMenuBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class MainMenuBuilder {
    class func build() -> UIViewController {
        let viewModel = MainMenuViewModel()
        let viewController = MainMenuViewController(viewModel: viewModel)
        viewController.title = "Ana Sayfa"
        return viewController
    }
}
