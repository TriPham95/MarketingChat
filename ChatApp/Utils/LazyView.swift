//
//  LazyView.swift
//  ChatApp
//
//  Created by Tri Pham on 9/19/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
