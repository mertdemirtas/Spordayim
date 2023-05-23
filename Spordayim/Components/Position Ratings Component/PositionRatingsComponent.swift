//
//  PositionRatingsComponent.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import UIKit

class PositionRatingsComponent: GenericBaseView<PositionRatingsComponentData> {
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 5.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var goalkeeperRating: SinglePositionRatingComponent = {
        let temp = SinglePositionRatingComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var defenceRating: SinglePositionRatingComponent = {
        let temp = SinglePositionRatingComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var midFielderRating: SinglePositionRatingComponent = {
        let temp = SinglePositionRatingComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var strikerRating: SinglePositionRatingComponent = {
        let temp = SinglePositionRatingComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(goalkeeperRating)
        containerStackView.addArrangedSubview(defenceRating)
        containerStackView.addArrangedSubview(midFielderRating)
        containerStackView.addArrangedSubview(strikerRating)
        
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        goalkeeperRating.setData(by: SinglePositionComponentData(labelString: data.goalKeeperStr))
        defenceRating.setData(by: SinglePositionComponentData(labelString: data.defenceStr))
        midFielderRating.setData(by: SinglePositionComponentData(labelString: data.midFielderStr))
        strikerRating.setData(by: SinglePositionComponentData(labelString: data.strikerStr))
    }
    
    public func getRatings() {
        print(goalkeeperRating.getStarRating(), midFielderRating.getStarRating(), strikerRating.getStarRating())
    }
    
    public func isUserTouchEnabled(bool: Bool) {
        goalkeeperRating.isUserInteractionEnabled = bool
        defenceRating.isUserInteractionEnabled = bool
        midFielderRating.isUserInteractionEnabled = bool
        strikerRating.isUserInteractionEnabled = bool
    }
}
