//
//  PassingValuesDown.swift
//  Redrawee
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

enum BindingExample {
    
    struct BindingEmitterView: View {
        
        @State var value = true
        
        var body: some View {
            VStack {
                Text("Emitter view")
                Toggle("Change value", isOn: $value)
                    .toggleStyle(.button)
                BindingPassthroughView(unused: $value)
            }
            .padding()
            .background(.random())
        }
    }
    
    struct BindingPassthroughView: View {
        
        @Binding var unused: Bool
        
        var body: some View {
            VStack {
                Text("Passthrough view")
                BindingReceiverView(usedValue: $unused)
            }
            .padding()
            .background(.random())
        }
    }
    
    struct BindingReceiverView: View {
        
        @Binding var usedValue: Bool
        
        var body: some View {
            VStack {
                Text("Receiver view")
                Text("Current value is \(usedValue)")
            }
            .padding()
            .background(.random())
        }
    }
}

enum EnvironmentExample {
    struct EnvironmentEmitterView: View {
        
        @State var value = true
        
        var body: some View {
            VStack {
                VStack {
                    Text("Emitter view")
                    Toggle("Change value", isOn: $value)
                        .toggleStyle(.button)
                        .toggleStyle(.button)
                }
                EnvironmentPassthroughView()
                    .environment(\.passingValuesDown, value)
            }
            .padding()
            .background(.random())
        }
    }
    
    struct EnvironmentPassthroughView: View {
        
        // This view doesn't depend on any of `DynamicProperty`, so it
        // is not redraw on change of values it children may depend on
        
        var body: some View {
            VStack {
                Text("Passthrough view")
                EnvironmentReceiverView()
            }
            .padding()
            .background(.random())
        }
    }
    
    struct EnvironmentReceiverView: View {
        
        @Environment(\.passingValuesDown) var usedValue: Bool
        
        var body: some View {
            VStack {
                Text("Receiver view")
                Text("Current value is \(usedValue)")
            }
            .padding()
            .background(.random())
        }
    }
    
    struct PassingValuesDownKey: EnvironmentKey {
        static let defaultValue: Bool = false
    }
}

extension EnvironmentValues {
    var passingValuesDown: Bool {
        get { self[EnvironmentExample.PassingValuesDownKey.self] }
        set { self[EnvironmentExample.PassingValuesDownKey.self] = newValue }
    }
}

struct PassingValuesDownView: View {
    
    @State var value = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Experiment")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                
                HStack {
                    Spacer()
                    BindingExample.BindingEmitterView()
                    Spacer()
                }
                HStack {
                    Spacer()
                    EnvironmentExample.EnvironmentEmitterView()
                    Spacer()
                }
                
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
}

#Preview("Passing Values Down") {
    PassingValuesDownView()
}

#Preview("Binding Example") {
    BindingExample.BindingEmitterView()
}

#Preview("Environment Example") {
    EnvironmentExample.EnvironmentEmitterView()
}
