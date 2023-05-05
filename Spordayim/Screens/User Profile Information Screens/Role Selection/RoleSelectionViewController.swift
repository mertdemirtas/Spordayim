//
//  RoleSelectionViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import UIKit

class RoleSelectionViewController: BaseViewController<RoleSelectionViewModel> {
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.registerCell(cells: [SelectionTableViewCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.dataSource = self
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addViewComponents() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension RoleSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRoles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell", for: indexPath) as? SelectionTableViewCell else { return UITableViewCell() }
        let data = viewModel.getRole(indexPath: indexPath)
        
        cell.setData(data: SelectionTableViewCellData(label: data))
        
        cell.genericView.setButtonAction { [weak self] in
            self?.viewModel.createUserDataToDatabase(role: data, completion: {
                let homePage = TabBarControllerViewControllerData(viewController: MainMenuBuilder.build(), tabBarControllerImageName: "house")
                
                let settingsPage = TabBarControllerViewControllerData(viewController: SearchScreenBuilder.build(), tabBarControllerImageName: "magnifyingglass")
                
                let profilePage = TabBarControllerViewControllerData(viewController: UserProfileBuilder.build(), tabBarControllerImageName: "person")
                
                let tabBarData = TabBarControllerComponentData(items: [homePage, settingsPage, profilePage])
                
                let tabBar = TabBarComponent(with: tabBarData)
                
                self?.view.window?.rootViewController = tabBar
                self?.view.window?.overrideUserInterfaceStyle = .light
                self?.view.window?.makeKeyAndVisible()
            })
        }
        
        return cell
    }
}
