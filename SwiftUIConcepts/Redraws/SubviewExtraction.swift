//
//  SubviewExtraction.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

struct SubviewExtraction: View {
    
    @State var value = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Experiment")
                .font(.system(size: 24, weight: .semibold, design: .default))
        
                nonExtractedView
                ExtractedView()
            
            Toggle("Toggle value", isOn: $value)
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
    
    var nonExtractedView: some View {
        VStack {
            Text("Non-extracted View Label")
            Image(systemName: "shippingbox.and.arrow.backward")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .debug()
    }
}

struct ExtractedView: View {
    
    var body: some View {
        VStack {
            Text("Extracted View Label")
            Image(systemName: "shippingbox.and.arrow.backward")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .debug()
    }
}

#Preview {
    NavigationStack {
        SubviewExtraction()
            .navigationTitle("Subview Extraction")
            .navigationBarTitleDisplayMode(.inline)
    }
}
