//
//  UserCell.swift
//  ChatApp
//
//  Created by Tri Pham on 8/1/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("INCOM")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text("Tho Pham")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("dasdad")
                        .font(.system(size: 15))
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
