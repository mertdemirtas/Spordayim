//
//  BaseSegmentedController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class TabBarComponent: UITabBarController {
    private var data: TabBarControllerComponentData?
    
    init(with data: TabBarControllerComponentData) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.data = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgroundColor
        let nav = UINavigationBarAppearance()
        nav.backgroundColor = .navBarColor
        UITabBar.appearance().barTintColor = .black
        tabBar.tintColor = .navBarColor
        
        loadDataView()
    }
    
    func returnData() -> TabBarControllerComponentData? {
        return data
    }
    
    private func loadDataView() {
        addItems()
    }
    
    private func addItems() {
        if let items = data?.items {
            var arr: [UIViewController] = []
            for element in items {
                if let viewController = createNavController(viewController: element) {
                    arr.append(viewController)
                }
            }
            self.setViewControllers(arr, animated: true)
        }
    }
    
    fileprivate func createNavController(viewController: TabBarControllerViewControllerData?) -> UIViewController? {
        guard let viewControllerData = viewController else { return nil }
        
        guard let rootViewController = viewControllerData.viewController else { return nil }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = UIImage(systemName: viewControllerData.tabBarControllerImageName ?? "")

        
        self.view.window?.rootViewController = navigationController
        return navigationController
    }
}
