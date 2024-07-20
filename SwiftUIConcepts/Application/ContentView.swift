//
//  ContentView.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("View Redraws") {
                    NavigationLink(destination: {
                        IdModifier()
                    }, label: {
                        Text("Modifier ") + Text(".id(_:)").monospaced()
                    })
                    NavigationLink("Subview Extraction") {
                        SubviewExtraction()
                    }
                    NavigationLink("Conditional Content") {
                        ConditionalContent()
                    }
                    NavigationLink("View Modifier Extraction") {
                        ViewModifierExtraction()
                            .navigationTitle("ViewModifier Extraction")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    NavigationLink("Passing Values Down") {
                        PassingValuesDownView()
                            .navigationTitle("Passing Values Down")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                
                NavigationLink("Takeaways") {
                    EmptyView()
                }
                
                Section("Observing Objects") {
                    NavigationLink("Observation Approach") {
                        ObservationDemo()
                    }
                    NavigationLink("@StateObject Wrapper") {
                        SubviewExtraction()
                    }
                    NavigationLink("@ObservableObject Wrapper") {
                        ConditionalContent()
                    }
                }
                
                Section("Animating changes") {
                    NavigationLink("Conditional Content vs ternary operator") {
                        ObservationDemo()
                    }
                    NavigationLink("@StateObject Wrapper") {
                        SubviewExtraction()
                    }
                    NavigationLink("@ObservableObject Wrapper") {
                        ConditionalContent()
                    }
                }
            }
            .navigationTitle("@Redrawee")
        }
    }
}

#Preview {
    ContentView()
}
