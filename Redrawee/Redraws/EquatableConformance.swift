//
//  EquatableConformance.swift
//  Redrawee
//
//  Created by eelenskiy on 07.08.2024.
//

import SwiftUI

struct EquatableConformance: View {
    
    @State var value = true
    
    var body: some View {
        EquatableConformingPODView(value: value)
            .equatable()
        
        EquatableConformingNonPODView(string: "Hello, world", value: value)
        
        Toggle("Toggle value", isOn: $value)
        Text("Value is equal to: \(value)")
    }
}

#Preview {
    EquatableConformance()
}

struct EquatableConformingPODView: View, Equatable {
    static func == (lhs: EquatableConformingPODView, rhs: EquatableConformingPODView) -> Bool {
        true
    }
    
    let value: Bool
    
    var body: some View {
        
        Label("Value: \(value)\nIs POD: \(_isPOD(EquatableConformingPODView.self))", systemImage: "star")
            .randomBackground()
        
    }
}

struct EquatableConformingNonPODView: View, Equatable {
    static func == (lhs: EquatableConformingNonPODView, rhs: EquatableConformingNonPODView) -> Bool {
        true
    }
    
    let string: String

    let value: Bool
    
    var body: some View {
        Label("Value: \(value)\nIs POD: \(_isPOD(EquatableConformingNonPODView.self))", systemImage: "star.fill")
            .randomBackground()
    }
}
