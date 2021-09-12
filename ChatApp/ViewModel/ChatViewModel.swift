//
//  ChatVIewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 8/23/21.
//

import Firebase

class ChatViewModel: ObservableObject {
    let user: User
    
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
//        messages = mockMessages
    }
    
//    var mockMessages: [Message] {
//        [
//            .init(isFromCurrentUser: true, messageText: "Hey, what's up man?"),
//            .init(isFromCurrentUser: false, messageText: "Not much, how are you"),
//            .init(isFromCurrentUser: true, messageText: "I'm fine"),
//            .init(isFromCurrentUser: true, messageText: "Hey, what's up man?"),
//            .init(isFromCurrentUser: false, messageText: "Hey, what's up man?"),
//            .init(isFromCurrentUser: true, messageText: "Hey, what's up man?"),
//        ]
//    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartneId = user.id else { return }
        
        let query = COLLECTION_MESSAGES.document(currentUid).collection(chatPartneId)
        
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.messages = documents.compactMap({ try? $0.data(as: Message.self)
            })
            
        }
        
        
        
    }
    
    
    func sendMessages(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartneId = user.id else { return }
//        let message = Message(isFromCurrentUser: true, messageText: messageText)
//        messages.append(message)
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartneId).document()
        let chatPartnerRef = COLLECTION_MESSAGES.document(chatPartneId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartneId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
    }
}
