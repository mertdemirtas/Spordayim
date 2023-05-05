//
//  SelectionCardViewButton.swift
//  Spordayim
//
//  Created by Mert Demirtas on 4.05.2023.
//

import UIKit

class SelectionCardViewButton: BaseButton<SelectionTableViewCellData> {
    
    private lazy var label: BaseLabel = {
        let temp = BaseLabel()
        temp.font = .boldSystemFont(ofSize: 18)
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        label.text = data.label
    }
}
