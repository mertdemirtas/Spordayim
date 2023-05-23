//
//  FirebaseManager.swift
//  Spordayim
//
//  Created by Mert Demirtas on 4.05.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore

struct ProfileData {
    let name: String
    let uid: String
    let email: String
    let city: String
    let district: String
    let role: String
    let credential: AuthCredential
}

struct UserProfileFirebaseData: Codable {
    let name: String?
    let profileImage: String?
    let birthdayDate: String?
    let city: String?
    let district: String?
    let friendshipCount: Int?
    let mainRole: String?
    let goalKeeperScore: Int?
    let defenceScore: Int?
    let strikerScore: Int?
    let midFielderScore: Int?
}

struct UserFriendShipsData: Codable {
    let friendships: [String: FriendShipDictData]
}

struct FriendShipDictData: Codable {
    let name: String?
    let friendshipStatus: Bool
}

class FirebaseMaganer {
    private let store = FirebaseFirestore.Firestore.firestore()
    private let ref = Database.database().reference()
    private let db = Firestore.firestore()
    
    private let usersCollection = "users"
    private let friendshipCollection = "friendship"
    
    func authUser(with credential: AuthCredential, completionHandler: @escaping (String) -> Void) {
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            guard let userUid = result?.user.uid else { return }
            
            completionHandler(userUid)
        }
    }
    
    func createDataForUser(with credential: AuthCredential, userData: ProfileData, completionHandler: @escaping (Bool) -> Void) {
        
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            
            guard let authUser = result?.user else { return }
            guard let name = authUser.displayName else { return }
            let uid = authUser.uid
            
            let data = ["name": userData.name,
                        "email": userData.email,
                        "uid": userData.uid,
                        "profileImage": authUser.photoURL?.absoluteString ?? "",
                        "username": "",
                        "city": userData.city,
                        "district": userData.district,
                        "mainRole": userData.role,
                        "goalKeeperScore": 0,
                        "midFielderScore": 0,
                        "strikerScore": 0]
            
            
            self.checkUserInDatabase(with: credential, completion: { success in
                if success {
                    // User currently in Database
                }
                
                else {
                    // User did not initiliaze in the Database
                    
                    print("Not Exists")
                    
                    Firestore.firestore().collection(self.usersCollection).document(authUser.uid).setData(data as [String : Any]) { err in
                        
                        if err != nil {
                            completionHandler(false)
                        }
                        
                        completionHandler(true)
                    }
                }
            })
        }
    }
    
    func checkUserInDatabase(with credential: AuthCredential, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(with: credential) { [weak self] result, error in
            guard error == nil else { return }
            
            guard let user = result?.user else { return }
            
            Firestore.firestore().collection(self?.usersCollection ?? "").document(user.uid).getDocument(completion: { result, error in
                if let exists = result?.exists {
                    
                    if exists == false { completion(false) }
                    
                    else { completion(true) }
                }
            })
        }
    }
    
    func getUserData(userUID: String?, completion: @escaping (Result<UserProfileFirebaseData, Error>) -> Void) {
        guard let userUID = userUID else { return }
        let docRef = db.collection(usersCollection).document(userUID)
        
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: document.data() as Any, options: [])
                    let decodedData = try JSONDecoder().decode(UserProfileFirebaseData.self, from: jsonData)
                    completion(.success(decodedData))

                }
                catch let error {
                    print(error)
                }
            }
        }
    }
    
    func getFriendShips(userUID: String?, completion: @escaping (Result<UserFriendShipsData, Error>) -> Void) {
        guard let userUID = userUID else { return }
        let docRef = db.collection(friendshipCollection).document(userUID)
        
        docRef.getDocument { (document, error) in
            if let error = error { completion(.failure(error)) }
            
            if let document = document, document.exists {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: document.data() as Any, options: [])
                    let decodedData = try JSONDecoder().decode(UserFriendShipsData.self, from: jsonData)
                    completion(.success(decodedData))
                }
                catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getUsers(completion: @escaping (Result<[UserListingData], Error>) -> Void) {
        let docRef = db.collection(usersCollection)
        
        var usersArr: [UserListingData] = []
        
        docRef.getDocuments() { (document, error) in
            if let document = document {
                for user in document.documents {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: user.data(), options: [])
                        let decodedData = try JSONDecoder().decode(UserListingData.self, from: jsonData)
                        usersArr.append(decodedData)
                    }
                    catch let error {
                        completion(.failure(error))
                    }
                }
                completion(.success(usersArr))
            }
            
            else {
                if let error = error { completion(.failure(error)) }
            }
        }
    }
}
