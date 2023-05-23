//
//  UserRolesData.swift
//  Spordayim
//
//  Created by Mert Demirtas on 19.05.2023.
//

import Foundation

struct UserPositionData: Codable {
    let mainRole: String?
    let userRolesRating: UserPositionsRating?
}

struct UserPositionsRating: Codable {
    let goalKeeper: Int?
    let striker: Int?
    let midFielder: Int?
}
