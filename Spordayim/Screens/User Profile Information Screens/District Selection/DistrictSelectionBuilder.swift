//
//  DistrictSelectionBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import UIKit
import FirebaseAuth

struct DistrictSelectionData {
    let name: String
    let uid: String
    let email: String
    let city: String
    let credential: AuthCredential
}

class DistrictSelectionBuilder {
    class func build(city: String, data: DistrictSelectionData) -> UIViewController {
        let viewModel = DistrictSelectionViewModel(city: city, data: data)
        let viewController = DistrictSelectionViewController(viewModel: viewModel)
        viewController.title = "Bulunduğunuz İlçe"
        return viewController
    }
}
