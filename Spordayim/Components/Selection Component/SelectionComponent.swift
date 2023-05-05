//
//  SelectionComponent.swift
//  Spordayim
//
//  Created by Mert Demirtas on 4.05.2023.
//

import Foundation

class SelectionComponent: BaseView {
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.registerCell(cells: [SelectionTableViewCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
}
