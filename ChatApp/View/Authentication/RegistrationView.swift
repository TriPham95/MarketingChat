//
//  RegistrationView.swift
//  ChatApp
//
//  Created by Tri Pham on 7/5/21.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: ProfilePhotoSelectorView().navigationBarBackButtonHidden(true),
                isActive: $viewModel.didAuthenticateUser,
                label: {})
            
            
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Get Started")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create Your Account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 32) {
                    CustomTextField(imageName: "envelope",
                                    placeholderName: "Email",
                                    isSecureField: false,
                                    text: $email)
                        .autocapitalization(.none)
                    
                    CustomTextField(imageName: "person",
                                    placeholderName: "Username",
                                    isSecureField: false,
                                    text: $username)
                        .autocapitalization(.none)
                    
                    CustomTextField(imageName: "person",
                                    placeholderName: "Full Name",
                                    isSecureField: false,
                                    text: $fullname)
                        .autocapitalization(.none)
                    
                    CustomTextField(imageName: "lock",
                                    placeholderName: "Password",
                                    isSecureField: true,
                                    text: $password)
                        .autocapitalization(.none)
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            
            Button(action: {
                viewModel.register(withEmail: email, password: password,
                                   fullname: fullname, username: username)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button(action: { mode.wrappedValue.dismiss() } , label: {
                HStack {
                    
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            })
            .padding(.bottom, 32)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
