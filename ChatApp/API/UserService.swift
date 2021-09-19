//
//  UserService.swift
//  ChatApp
//
//  Created by Tri Pham on 9/19/21.
//

import Foundation

struct UserService {
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}
