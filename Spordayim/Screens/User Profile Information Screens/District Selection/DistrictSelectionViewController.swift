//
//  DistrictSelectionViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import UIKit

class DistrictSelectionViewController: BaseViewController<DistrictSelectionViewModel> {
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

extension DistrictSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDistrictCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell", for: indexPath) as? SelectionTableViewCell else { return UITableViewCell() }
        let data = viewModel.getDistrinct(indexPath: indexPath)
        cell.setData(data: SelectionTableViewCellData(label: data))
        
        cell.genericView.setButtonAction { [weak self] in
            guard let prevData = self?.viewModel.getData() else { return }
            let data = RoleSelectionData(name: prevData.name, uid: prevData.uid, email: prevData.email, city: prevData.city, district: data, credential: prevData.credential)
            let viewController = RoleSelectionBuilder.build(data: data)
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
        return cell
    }
}
