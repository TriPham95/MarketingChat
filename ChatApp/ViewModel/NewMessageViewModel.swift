//
//  NewMessageViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/12/21.
//

import SwiftUI
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != AuthViewModel.shared.userSession?.uid })
            
        }
    }
    
    
}
