//
//  TestRawState.swift
//  Redrawee
//
//  Created by eelenskiy on 26.07.2024.
//

import SwiftUI

struct TestRawStateView: View {
    
    let _value = State(initialValue: false)
    var value: Bool {
        get {
            _value.wrappedValue
        }
        nonmutating set {
            _value.wrappedValue = newValue
        }
    }
    
    var body: some View {
        Toggle("toggle", isOn: Binding(get: {
            value
        }, set: {
            value = $0
        }))
    }
}

#Preview {
    TestRawStateView()
}
