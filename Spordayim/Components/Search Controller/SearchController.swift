//
//  SearchController.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit

class SearchController: BaseSearchController<SearchControllerViewModel> {

    
    
    override func prepareSearchControllerConfigurations() {
        super.prepareSearchControllerConfigurations()
        searchBar.delegate = self
        delegate = self
        searchResultsUpdater = self
        searchBar.autocapitalizationType = .none
        definesPresentationContext = false
        obscuresBackgroundDuringPresentation = true
    }
}

// MARK: - Extensions
extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
}
extension SearchController: UISearchControllerDelegate {
}
