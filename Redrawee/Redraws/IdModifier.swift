//
//  IdModifier.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

struct IdModifier: View {
    
    @State var viewId = UUID()
    
    var body: some View {
        ExtractedView()
            .id(viewId)
            .padding()
        
        Button("Change view ID") {
            viewId = UUID()
        }
    }
}

#Preview {
    IdModifier()
}
