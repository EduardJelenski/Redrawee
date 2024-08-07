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
        
        ExperimentPresentation(experiment: {
            VStack(alignment: .center, spacing: 16) {
                nonExtractedView
                    .printType()
                ExtractedView()
                    .printType()
                
                Toggle("Toggle value", isOn: $value)
                    .toggleStyle(.button)
            }
        
            
        }, explanation: {
            Text(
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
            """
            )
            
            Spacer()
        })
    }
    
    var nonExtractedView: some View {
        HStack {
            Image(systemName: "shippingbox")
            Text("Non-extracted View Label")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .randomBackground()
    }
}

struct ExtractedView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "shippingbox.and.arrow.backward")
            Text("Extracted View Label")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .randomBackground()
    }
}

#Preview {
    NavigationStack {
        SubviewExtraction()
            .navigationTitle("Subview Extraction")
            .navigationTitleDisplayModeIfApplicable(.inline)
    }
}
