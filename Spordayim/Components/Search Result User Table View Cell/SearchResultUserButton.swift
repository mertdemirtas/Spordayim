//
//  SearchResultUserButton.swift
//  Spordayim
//
//  Created by Mert Demirtas on 22.05.2023.
//

import UIKit

class SearchResultUserButton: BaseButton<SearchResultUserTableViewCellData> {
    private lazy var cardView: SearchResultUserTableViewCellCardView = {
        let temp = SearchResultUserTableViewCellCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        
        addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        cardView.setData(by: data)
    }
}
