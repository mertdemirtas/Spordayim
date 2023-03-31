//
//  BaseViewModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 22.09.2022.
//

import Combine

protocol BaseViewModelNetworkStateDelegate: AnyObject {
    func networkStateChanged()
}

class BaseViewModel {
    weak var networkStateDelegate: BaseViewModelNetworkStateDelegate?
    
    init() {
        networkState()
    }
}

extension BaseViewModel {
    private func networkState() {
        
    }
}

