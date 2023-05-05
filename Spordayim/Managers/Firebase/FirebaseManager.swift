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

struct ProfileData {
    let name: String?
    let email: String?
    let userUID: String?
    let username: String?
}

class FirebaseMaganer {
    private let store = FirebaseFirestore.Firestore.firestore()
    private let ref = Database.database().reference()
    
    private let usersCollection = "users"
    
    
    func authUser(with credential: AuthCredential, completionHandler: @escaping (Bool) -> Void) {
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            completionHandler(true)
        }
    }
    
    func createDataForUser(with credential: AuthCredential, completionHandler: @escaping (Bool) -> Void) {
        
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            
            guard let authUser = result?.user else { return }
            guard let name = authUser.displayName else { return }
            let uid = authUser.uid
            
            let data = ["name": name,
                        "email": authUser.email,
                        "uid": uid,
                        "username": ""]
            
            
            self.checkUserInDatabase(with: credential, completion: { success in
                if success {
                    // User currently in Database
                }
                
                else {
                    // User did not initiliaze in the Database
                    
                    print("Not Exists")
                    
                    Firestore.firestore().collection("users").document(authUser.uid).setData(data as [String : Any]) { err in
                        
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
}
