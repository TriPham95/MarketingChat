//
//  SelectableUser.swift
//  ChatApp
//
//  Created by Tri Pham on 9/19/21.
//

import Foundation

struct SelectableUser: Identifiable {
    var user: User
    var isSelected: Bool
    
    var id: String { return user.id ?? NSUUID().uuidString }
}
