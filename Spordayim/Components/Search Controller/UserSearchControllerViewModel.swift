//
//  SearchControllerViewModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

struct UserListingData: Codable {
    let uid: String?
    let name: String?
    let profileImage: String?
}

protocol UserSearchControllerViewModelDelegate: AnyObject {
    func reloadData()
}

class UserSearchControllerViewModel {
    private let firebaseManager = FirebaseMaganer()
    private var usersArray: [UserListingData] = []
    private var filteredArray: [UserListingData] = []
    
    weak var delegate: UserSearchControllerViewModelDelegate?
    lazy var rooter = UserSearchControllerRooter()
    
    func getUsers(keyWord: String?) {
        guard let keyWord = keyWord else { return }
        
        if usersArray.isEmpty {
            getUsersFromDatabase(completion: { [weak self] result in
                switch result {
                    case .success(let data):
                    
                    self?.setUsers(data: data)
                    
                    self?.filterDataWithKeyword(keyWord: keyWord.lowercased())
                                        
                    case .failure(let error):
                        print(error)
                }
            })
        }
        else { filterDataWithKeyword(keyWord: keyWord) }
    }
    
    func getUserCount() -> Int {
        return filteredArray.count
    }
    
    func clearTableViewData() {
        filteredArray = []
        delegate?.reloadData()
    }
    
    func getUserByIndex(indexPath: IndexPath) -> SearchResultUserTableViewCellData? {
        let user = filteredArray[indexPath.row]
        let data = SearchResultUserTableViewCellData(imageURLString: user.profileImage, userName: user.name, userUID: user.uid)
        return data
    }
    
    private func getUsersFromDatabase(completion: @escaping (Result<[UserListingData], Error>) -> Void) {
        firebaseManager.getUsers(completion: { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    private func setUsers(data: [UserListingData]?) {
        guard let data = data else { return }
        guard let currentUserUID = FirebaseAuth.Auth.auth().currentUser?.uid else { return }
        
        var tempData = data

        for (index, element) in data.enumerated() {
            if element.uid == currentUserUID {
                tempData.remove(at: index)
            }
            
        }
        self.usersArray = data
    }
    
    private func filterDataWithKeyword(keyWord: String) {
        filteredArray = usersArray.filter { ($0.name?.lowercased().contains(keyWord) ?? true) }
        delegate?.reloadData()
    }
}
