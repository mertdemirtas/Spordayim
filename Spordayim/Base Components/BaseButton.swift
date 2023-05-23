//
//  BaseButton.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 9.04.2022.
//

import UIKit

class BaseButton<T>: GenericBaseView<T>, UIGestureRecognizerDelegate {
    
    private var buttonTapCallback: () -> () = {}
    
    lazy var buttonLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func setupViewConfigurations() {
        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(BaseButton.buttonTapped))
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startTappedAnimation { finish in
            if finish {
                self.isUserInteractionEnabled = true
                self.buttonTappedAction()
            }
        }
    }
    
    public func addViewOnCenter(view: UIView) {
        addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func addView(view: UIView) {
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setButtonAction(action:@escaping () -> ()) {
        self.buttonTapCallback = action
    }
    
    private func buttonTappedAction() {
        buttonTapCallback()
    }
}
