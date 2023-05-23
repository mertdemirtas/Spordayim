//
//  OtherUserProfilePageBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import UIKit

class OtherUserProfilePageBuilder {
    class func build(userUID: String) -> UIViewController {
        let viewModel = OtherUserProfilePageViewModel(userUID: userUID)
        let viewController = OtherUserProfilePageViewController(viewModel: viewModel)
        
        return viewController
    }
}

