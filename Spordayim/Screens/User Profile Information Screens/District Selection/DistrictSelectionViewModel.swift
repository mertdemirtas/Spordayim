//
//  DistrictSelectionViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import Foundation

class DistrictSelectionViewModel: BaseViewModel {
    private let citiesHelper = CitiesHelper()
    
    private let city: String
    private let data: DistrictSelectionData
    
    init(city: String, data: DistrictSelectionData) {
        self.city = city
        self.data = data
        super.init()
    }
    
    func getData() -> DistrictSelectionData {
        return data
    }
    
    func getDistrinct(indexPath: IndexPath) -> String {
        let data = citiesHelper.getStates(cityName: city)
        return data[indexPath.row]
    }
    
    func getDistrictCount() -> Int {
        let data = citiesHelper.getStates(cityName: city)
        return data.count
    }
}
