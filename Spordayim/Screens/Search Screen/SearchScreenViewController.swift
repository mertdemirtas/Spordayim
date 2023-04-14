//
//  SearchScreenViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 14.04.2023.
//

import UIKit

class SearchScreenViewController: BaseViewController<BaseViewModel> {
    // MARK: Components
    private lazy var searchController: SearchController = {
        let temp = SearchController(viewModel: SearchControllerViewModel())
        return temp
    }()

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
}

extension SearchScreenViewController {
    private func setupSearchController() {
        navigationItem.searchController = searchController
    }
}
