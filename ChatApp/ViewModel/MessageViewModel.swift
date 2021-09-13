//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/12/21.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
}
