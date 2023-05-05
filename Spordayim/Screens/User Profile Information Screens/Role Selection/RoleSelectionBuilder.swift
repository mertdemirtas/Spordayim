//
//  RoleSelectionBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import UIKit
import FirebaseAuth

struct RoleSelectionData {
    let name: String
    let uid: String
    let email: String
    let city: String
    let district: String
    let credential: AuthCredential
}

class RoleSelectionBuilder {
    class func build(data: RoleSelectionData) -> UIViewController {
        let viewModel = RoleSelectionViewModel(data: data)
        let viewController = RoleSelectionViewController(viewModel: viewModel)
        viewController.title = "Tercih Ettiğiniz Rol"
        return viewController
    }
}
