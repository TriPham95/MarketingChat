//
//  CustomTextField.swift
//  ChatApp
//
//  Created by Tri Pham on 7/10/21.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderName: String
    let isSecureField: Bool
    @Binding var text: String
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))

                if isSecureField {
                    SecureField(placeholderName, text: $text)
                } else {
                    TextField(placeholderName, text: $text)
                }
                
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}
