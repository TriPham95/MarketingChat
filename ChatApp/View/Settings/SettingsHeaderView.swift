//
//  SettingssHeaderView.swift
//  ChatApp
//
//  Created by Tri Pham on 7/10/21.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack {
            Image("INCOM")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Tho Pham")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                
            }
            
            Spacer()
            
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
