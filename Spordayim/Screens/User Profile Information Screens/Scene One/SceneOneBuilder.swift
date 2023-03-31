//
//  SceneOneBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit

class SceneOneBuilder {
    class func build() -> UIViewController {
        let viewModel = SceneOneViewModel()
        let viewController = SceneOneViewController(viewModel: viewModel)
        return viewController
    }
}
