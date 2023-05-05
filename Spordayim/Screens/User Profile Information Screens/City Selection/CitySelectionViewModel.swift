//
//  SceneOneViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 31.03.2023.
//

import Foundation

protocol CitySelectionViewModelDelegate: AnyObject {
    func reloadData()
}

class CitySelectionViewModel: BaseViewModel {
    private let citiesHelper = CitiesHelper()
    private let databaseData: CitySelectionData
    
    init(data: CitySelectionData) {
        self.databaseData = data
        super.init()
    }
    
    func returnData() -> CitySelectionData {
        return databaseData
    }
    
    func getCityData(index: IndexPath) -> String {
        let cities = citiesHelper.getCities()
        return cities[index.row]
    }
    
    func getNumberOfCities() -> Int {
        let cities = citiesHelper.getCities()
        return cities.count
    }
}
