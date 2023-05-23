//
//  SearchController.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit

class UserSearchController: BaseSearchController<UserSearchControllerViewModel> {

    lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.registerCell(cells: [UserSearchTableViewCell.self])
        temp.dataSource = self
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func prepareSearchControllerConfigurations() {
        super.prepareSearchControllerConfigurations()
        viewModel.delegate = self
        searchBar.delegate = self
        delegate = self
        searchResultsUpdater = self
        searchBar.autocapitalizationType = .none
        definesPresentationContext = false
        obscuresBackgroundDuringPresentation = true
        
        prepareTableView()
    }
    
    func prepareTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Extensions
extension UserSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchBarText = searchBar.text else { return }
        
        if searchBarText.count > 2 {
            viewModel.getUsers(keyWord: searchBarText)
        }
        
        else { viewModel.clearTableViewData() }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

    }
}

extension UserSearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
    }
}

extension UserSearchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUserCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserSearchTableViewCell", for: indexPath) as? UserSearchTableViewCell else { return UITableViewCell() }
        
        if let cellData = viewModel.getUserByIndex(indexPath: indexPath) {
            cell.setData(data: cellData)
            cell.genericView.setButtonAction { [weak self] in
                if let userUID = cellData.userUID {
                    let vc = OtherUserProfilePageBuilder.build(userUID: userUID)
                    self?.presentingViewController?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        return cell
    }
}

extension UserSearchController: UISearchControllerDelegate {
}

// MARK: - ViewModel Delegate
extension UserSearchController: UserSearchControllerViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
