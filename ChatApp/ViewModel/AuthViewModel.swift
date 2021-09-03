//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/3/21.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    func login() {
        print("Login...")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("Register")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error: \(error.localizedDescription)")
                return
            }
        }
        
    }
    
    func uploadProfileImage() {
        
    
    }
    
    func logout() {
        
        
    }
}
