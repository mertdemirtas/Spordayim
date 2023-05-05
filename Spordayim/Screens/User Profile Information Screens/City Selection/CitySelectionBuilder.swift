//
//  SceneOneBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class CitySelectionBuilder {
    class func build() -> UIViewController {
        let viewModel = CitySelectionViewModel()
        let viewController = CitySelectionViewController(viewModel: viewModel)
        return viewController
    }
}
