//
//  SceneOneBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import UIKit
import FirebaseAuth

struct CitySelectionData {
    let name: String
    let uid: String
    let email: String
    let credential: AuthCredential
}

class CitySelectionBuilder {
    class func build(data: CitySelectionData) -> UIViewController {
        let viewModel = CitySelectionViewModel(data: data)
        let viewController = CitySelectionViewController(viewModel: viewModel)
        viewController.title = "Bulunduğunuz İl"
        return viewController
    }
}
