//
//  UserCell.swift
//  ChatApp
//
//  Created by Tri Pham on 8/1/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                
                Image("INCOM")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Tho Pham")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@Tho")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
