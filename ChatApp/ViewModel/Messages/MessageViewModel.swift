//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/12/21.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageURL else { return nil }
        return URL(string: profileImageUrl)
    }
    
    
}
