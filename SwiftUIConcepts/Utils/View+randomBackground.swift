//
//  View+randomBackground.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

extension View {
    
    func randomBackground() -> some View {
        modifier(RandomBackgroundModifier())
    }
    
    func debug() -> some View {
        background(Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        ))
    }
}

struct RandomBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.random())
    }
}

#Preview {
    Text("Hello, world!")
        .modifier(RandomBackgroundModifier())
}

extension ShapeStyle where Self == Color {
    
    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
