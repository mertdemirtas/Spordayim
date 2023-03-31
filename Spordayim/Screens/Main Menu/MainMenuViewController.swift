//
//  MainMenuViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import Foundation
import UIKit

class MainMenuViewController: BaseViewController<MainMenuViewModel> {
    private lazy var navigationBarSettingsButton: NavigationBarSettingsButton = {
        let temp = NavigationBarSettingsButton()
        temp.setButtonAction { [weak self] in
            let vc = AppSettingsBuilder.build()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBarItems()
    }
    
    private func prepareNavigationBarItems() {
        let rightBarItem = UIBarButtonItem(customView: navigationBarSettingsButton)
        self.navigationItem.setRightBarButton(rightBarItem, animated: true)
    }
}
