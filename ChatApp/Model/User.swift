//
//  User.swift
//  ChatApp
//
//  Created by Tri Pham on 9/11/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullname: String
    let profileImageURL: String
    

    
}

let MOCK_USER = User(id: "1234",
                     email: "test",
                     username: "Tho",
                     fullname: "Tho Pham", profileImageURL: "INCOM.png")


//    init(_ dictionary: [String: Any]) {
//        self.username = dictionary["username"] as? String ?? ""
//        self.email = dictionary["email"] as? String ?? ""
//        self.fullname = dictionary["fullname"] as? String ?? ""
//        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
//    }
