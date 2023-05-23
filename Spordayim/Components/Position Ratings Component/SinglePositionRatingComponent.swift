//
//  SinglePositionRatingComponent.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import UIKit

class SinglePositionRatingComponent: GenericBaseView<SinglePositionComponentData> {
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.spacing = 10.0
        temp.distribution = .fill
        temp.alignment = .center
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var strLabel: UILabel = {
        let temp = UILabel()
        temp.font = .boldSystemFont(ofSize: 18)
        temp.textColor = .black
        temp.textAlignment = .center
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var starRating: CosmosView = {
        let temp = CosmosView()
        temp.widthAnchor.constraint(equalToConstant: 180).isActive = true
        temp.settings.fillMode = .full
        temp.starSize = 25
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(strLabel)
        containerStackView.addArrangedSubview(starRating)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        strLabel.text = data.labelString
    }
    
    public func getStarRating() -> Int {
        return Int(round(starRating.rating))
    }
}
