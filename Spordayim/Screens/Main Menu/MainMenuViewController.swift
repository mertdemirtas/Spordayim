//
//  MainMenuViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import Foundation
import UIKit

class MainMenuViewController: BaseViewController<MainMenuViewModel> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func addViewComponents() {
        super.addViewComponents()
    }
}
