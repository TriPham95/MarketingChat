//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 9/3/21.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    private var tempCurrentUser : FirebaseAuth.User?
    
    
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
            
            guard let user = result?.user else { return }
            
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.tempCurrentUser = user
                self.didAuthenticateUser = true
                
            }
        }
        
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(
                ["profileImageUrl" : imageUrl]) { _ in
                print("Successfully update user data..")
                
            }
        }
        
    
    }
    
    func logout() {
        
        
    }
}
