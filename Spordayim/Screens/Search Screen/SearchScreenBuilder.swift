//
//  SearchScreenBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class SearchScreenBuilder {
    class func build() -> UIViewController {
        let viewModel = SearchScreenViewModel()
        let viewController = SearchScreenViewController(viewModel: viewModel)
        viewController.title = "Keşfet"
        return viewController
    }
}
