//
//  RoleSelectionViewModel.swift
//  Spordayim
//
//  Created by Mert Demirtas on 5.05.2023.
//

import Foundation
import FirebaseAuth

class RoleSelectionViewModel: BaseViewModel {
    private let firebaseManager = FirebaseMaganer()
    
    private let roles = ["Kaleci", "Defans", "Orta Saha", "Forvet"]
    
    private let data: RoleSelectionData
    
    init(data: RoleSelectionData) {
        self.data = data
        super.init()
    }
    
    func createUserDataToDatabase(role: String, completion: @escaping () -> Void) {
        let profileData = ProfileData(name: data.name, uid: data.uid, email: data.email, city: data.city, district: data.district, role: role, credential: data.credential)
        firebaseManager.createDataForUser(with: data.credential,userData: profileData ,completionHandler: { [weak self] res in
            completion()
        })
    }
    
    func getRole(indexPath: IndexPath) -> String {
        return roles[indexPath.row]
    }
    
    func getNumberOfRoles() -> Int {
        return roles.count
    }
}
