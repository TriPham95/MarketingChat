//
//  Extension.swift
//  ChatApp
//
//  Created by Tri Pham on 8/14/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
