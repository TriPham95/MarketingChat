//
//  Channel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/19/21.
//

import FirebaseFirestoreSwift

struct Channel: Identifiable, Decodable {
    @DocumentID var id: String?
    var name: String
    var imageUrl: String?
    var uids: [String]
    var lastMessage: String
}
