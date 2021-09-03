//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Tri Pham on 7/5/21.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
//            MainTabView()
        }
    }
}
