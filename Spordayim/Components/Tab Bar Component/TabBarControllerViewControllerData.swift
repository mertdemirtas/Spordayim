//
//  SegmentedControlViewControllerData.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

struct TabBarControllerViewControllerData {
    let viewController: UIViewController?
    let tabBarControllerDisplayName: String?
    let tabBarControllerImageName: String?
    let title: String?
    
    init(viewController: UIViewController? = nil, tabBarControllerDisplayName: String? = nil, tabBarControllerImageName: String? = nil, title: String? = nil) {
        self.viewController = viewController
        self.tabBarControllerDisplayName = tabBarControllerDisplayName
        self.tabBarControllerImageName = tabBarControllerImageName
        self.title = title
    }
}
