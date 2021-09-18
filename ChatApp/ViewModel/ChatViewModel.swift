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
        
        let query = COLLECTION_MESSAGES
            .document(currentUid)
            .collection(chatPartneId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap{ try? $0.document.data(as: Message.self) }
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = self.user
            }
            self.messages.append(contentsOf: messages)
            
        }
    }
    
    
    func sendMessages(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
//        let message = Message(isFromCurrentUser: true, messageText: messageText)
//        messages.append(message)
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUid)
        
        let recentCurrentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
            .document(chatPartnerId)
        
        let recentPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection("recent-messages")
            .document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        
        recentCurrentRef.setData(data)
        recentPartnerRef.setData(data)
    }
}
