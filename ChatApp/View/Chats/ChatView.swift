//
//  ChatsView.swift
//  ChatApp
//
//  Created by Tri Pham on 7/10/21.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
//    @ObservedObject var viewModel = ChatViewModel()
    @ObservedObject var viewModel: ChatViewModel

    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
//                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessages(messageText)
        messageText = ""
    }
}
