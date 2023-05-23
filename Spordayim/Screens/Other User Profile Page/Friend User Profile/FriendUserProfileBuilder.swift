//
//  FriendUserProfileBuilder.swift
//  Spordayim
//
//  Created by Mert Demirtas on 22.05.2023.
//

import UIKit

class FriendUserProfileBuilder {
    class func build() -> UIViewController {
        let viewModel = FriendUserViewModel()
        let viewController = FriendUserViewController(viewModel: viewModel)
        return viewController
    }
}
