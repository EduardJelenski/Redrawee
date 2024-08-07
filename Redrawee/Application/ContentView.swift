//
//  ContentView.swift
//  Redrawee
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
#if os(iOS)
        iOSContentView()
#else
        MacOSContentView()
#endif
    }
}

#Preview {
    ContentView()
}

private struct iOSContentView: View {
    
    @StateObject var m = ModelObj()
    
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
                            .navigationTitleDisplayModeIfApplicable(.inline)
                    }
                    NavigationLink("View Modifier Extraction") {
                        ViewModifierExtraction()
                            .navigationTitle("ViewModifier Extraction")
                            .navigationTitleDisplayModeIfApplicable(.inline)
                    }
                    NavigationLink(destination: {
                        IdModifier()
                    }, label: {
                        Text("@ViewBuilder").monospaced()
                    })
                }
                
                Section("View Equatability") {
                    NavigationLink("POD types") {
                        WorkInProgressView()
                            .navigationTitle("POD types")
                    }
                    NavigationLink("Non-POD types") {
                        WorkInProgressView()
                            .navigationTitle("Non-POD types")
                    }
                }
                
                Section("State Management") {
                    NavigationLink("Passing Values Down") {
                        PassingValuesDownView()
                            .navigationTitle("Passing Values Down")
                            .navigationTitleDisplayModeIfApplicable(.inline)
                    }
                    NavigationLink(destination: {
                        WorkInProgressView()
                    }, label: {
                        Text("Observable").monospaced()
                        + Text(" vs ObservableObject")
                    })
                    NavigationLink("@StateObject, @ObservableObject") {
                        WorkInProgressView()
                    }
                }
                
                Section("Animating changes") {
                    NavigationLink("Conditional Content") {
                        WorkInProgressView()
                    }
                    NavigationLink("Ternary Operator") {
                        WorkInProgressView()
                    }
                }
            }
            .navigationTitle("@Redrawee")
        }
    }
}


private struct MacOSContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Group {
                    Section("View Redraws") {
                        NavigationLink(destination: {
                            IdModifier()
                        }, label: {
                            Text("Modifier ") + Text(".id(_:)").monospaced()
                        })
                        NavigationLink("Subview Extraction") {
                            SubviewExtraction()
                                .navigationTitle("Subview Extraction")
                        }
                        NavigationLink("View Modifier Extraction") {
                            ViewModifierExtraction()
                                .navigationTitle("ViewModifier Extraction")
                        }
                        NavigationLink("@ViewBuilder (_ConditionalContent)") {
                            ConditionalContent()
                        }
                    }
                    
                    NavigationLink("Takeaways") {
                        Text("")
                            .navigationTitle("Takeaways")
                    }
                }
                .padding()
                
                Section("State Management") {
                    NavigationLink("Passing Values Down") {
                        PassingValuesDownView()
                            .navigationTitle("Passing Values Down")
                    }
                    NavigationLink(destination: {
                        ObservationDemo()
                    }, label: {
                        Text("Observable").monospaced()
                        + Text(" vs ObservableObject")
                    })
                    NavigationLink("@StateObject, @ObservableObject") {
                        ObservableObjectsExample()
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
