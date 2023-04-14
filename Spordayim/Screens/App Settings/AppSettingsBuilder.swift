//
//  AppSettingsBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class AppSettingsBuilder {
    class func build() -> UIViewController {
        let viewModel = AppSettingsViewModel()
        let viewController = AppSettingsViewController(viewModel: viewModel)
        viewController.title = "Ayarlar"
        return viewController
    }
}
