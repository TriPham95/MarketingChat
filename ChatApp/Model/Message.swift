//
//  Messaage.swift
//  ChatApp
//
//  Created by Tri Pham on 8/14/21.
//

import FirebaseFirestoreSwift
import Firebase


struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
