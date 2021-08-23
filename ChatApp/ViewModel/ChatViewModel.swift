//
//  ChatVIewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 8/23/21.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hey, what's up man?"),
            .init(isFromCurrentUser: false, messageText: "Not much, how are you"),
            .init(isFromCurrentUser: true, messageText: "I'm fine"),
            .init(isFromCurrentUser: true, messageText: "Hey, what's up man?"),
            .init(isFromCurrentUser: false, messageText: "Hey, what's up man?"),
            .init(isFromCurrentUser: true, messageText: "Hey, what's up man?"),
        ]
    }
    
    
    func sendMessages(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
        
    }
}
