//
//  ConditionalContent.swift
//  Redrawee
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

struct ConditionalContent: View {
    
    @State var value = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Experiment")
                .font(.system(size: 24, weight: .semibold, design: .default))
            
            if value {
                Text("View when value is true")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.random())
            } else {
                Text("View when value is false")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.random())
            }
            
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
}

#Preview {
    NavigationStack {
        ConditionalContent()
            .navigationTitle("Conditional Content")
//            .navigationTitleDisplayModeIfApplicable(.inline)
    }
}
