//
//  ViewModifierExtraction.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

struct ViewModifierExtraction: View {
    
    @State var value = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Experiment")
                .font(.system(size: 24, weight: .semibold, design: .default))
            
            Text("Text with Icon added through method")
                .iconThroughMethod()
            
            Text("Text with Icon added through modifier")
                .iconThroughModifier()
            
            Toggle("Change value", isOn: $value)
                .toggleStyle(.button)
            
            Text("Explanation")
                .font(.system(size: 24, weight: .semibold, design: .default))
            Text(
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
            """
            )
            
            Spacer()
        }
        .padding()
    }
}

extension View {
    
    func iconThroughMethod() -> some View {
        HStack {
            Image(systemName: "applelogo")
            self
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.random())
    }
    
    func iconThroughModifier() -> some View {
        modifier(IconModifier())
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Image(systemName: "applelogo")
            content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.random())
    }
}

#Preview {
    NavigationStack {
        ViewModifierExtraction()
            .navigationTitle("ViewModifier Extraction")
            .navigationBarTitleDisplayMode(.inline)
    }
    
}
