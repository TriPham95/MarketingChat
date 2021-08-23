//
//  Messaage.swift
//  ChatApp
//
//  Created by Tri Pham on 8/14/21.
//

import Foundation


struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
    
}
