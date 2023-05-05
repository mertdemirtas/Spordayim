//
//  SceneOneViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import Foundation
import UIKit

class CitySelectionViewController: BaseViewController<CitySelectionViewModel> {
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

extension CitySelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell", for: indexPath) as? SelectionTableViewCell else { return UITableViewCell() }
        let data = viewModel.getCityData(index: indexPath)
        cell.setData(data: SelectionTableViewCellData(label: data))
        
        cell.genericView.setButtonAction { [weak self] in
            guard let previousData = self?.viewModel.returnData() else { return }
            
            let iterationData = DistrictSelectionData(name: previousData.name, uid: previousData.uid, email: previousData.email, city: data, credential: previousData.credential)
            let vc = DistrictSelectionBuilder.build(city: data, data: iterationData)
            
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}
