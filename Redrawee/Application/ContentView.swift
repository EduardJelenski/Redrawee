//
//  ContentView.swift
//  Redrawee
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
                            .navigationTitle("Subview Extraction")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    NavigationLink("View Modifier Extraction") {
                        ViewModifierExtraction()
                            .navigationTitle("ViewModifier Extraction")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    NavigationLink("@ViewBuilder (_ConditionalContent)") {
                        ConditionalContent()
                    }
                }
                
                NavigationLink("Takeaways") {
                    Text("")
                        .navigationTitle("Takeaways")
                }
                
                Section("State Management") {
                    NavigationLink("Passing Values Down") {
                        PassingValuesDownView()
                            .navigationTitle("Passing Values Down")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    NavigationLink(destination: {
                        ObservationDemo()
                    }, label: {
                        Text("Observable").monospaced()
                        + Text(" vs ObservableObject")
                    })
                    NavigationLink("@StateObject Wrapper") {
                        SubviewExtraction()
                    }
                    NavigationLink("@ObservableObject Wrapper") {
                        ConditionalContent()
                    }
                    
                }
                
                NavigationLink("Takeaways") {
                    Text("")
                        .navigationTitle("Takeaways")
                }
                
                Section("Animating changes") {
                    NavigationLink("Conditional Content") {
                        ObservationDemo()
                    }
                    NavigationLink("Ternary Operator") {
                        ObservationDemo()
                    }
                }
                
                NavigationLink("Takeaways") {
                    Text("")
                        .navigationTitle("Takeaways")
                }
            }
            .navigationTitle("@Redrawee")
        }
    }
}

#Preview {
    ContentView()
}
