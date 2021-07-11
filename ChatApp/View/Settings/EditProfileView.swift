//
//  EditProfileView.swift
//  ChatApp
//
//  Created by Tri Pham on 7/11/21.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = "Tho Pham"
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 44) {
                
                VStack {
                    
                    HStack {
                        
                        VStack {
                            Image("INCOM")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                            
                            Button(action: {
                                print("Change profile photo here")
                            }, label: {
                                Text("Edit")
                            })
                        }
                        .padding(.top)
                        
                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                        
                        
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $fullname)
                        .padding(8)
                    
                }
                .background(Color.white)
                
                VStack(alignment: .leading) {
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    
                    NavigationLink(
                        destination: Text("Edit Status"),
                        label: {
                            HStack {
                                Text("At the movie")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                        })
                    
                }
                
                Spacer()
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
