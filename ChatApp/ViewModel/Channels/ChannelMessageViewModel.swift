//
//  ChannelMessageViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/19/21.
//

import Foundation

struct ChannelMessageViewModel {
    let message: ChannelMessage
    
    var currentUid: String { return AuthViewModel.shared.userSession?.uid ?? "" }
    
    var isFromCurrentUser: Bool { return message.fromId == currentUid }
    
    var fullname: String {
        return message.user?.fullname ?? ""
    }
}
