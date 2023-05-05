//
//  ProvinceDictionary.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import Foundation

struct CitiesHelper {
    
    private let data = ["Istanbul" : ["Tuzla", "Kartal", "Maltepe"],
                        "Kocaeli": ["Izmit", "Gebze", "Sakarya"],
                        ]
    
    public func getCities() -> [String] {
        return data.map { $0.key }
    }
    
    public func getStates(cityName: String) -> [String] {
        return data[cityName] ?? []
    }
}
