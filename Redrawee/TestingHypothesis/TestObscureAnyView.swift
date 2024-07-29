//
//  ObscureAnyView.swift
//  Redrawee
//
//  Created by eelenskiy on 25.07.2024.
//

import SwiftUI

struct ObscureAnyView: View {
    
    var body: some View {
        Label("Obsurely erased to AnyView", systemImage: "applelogo")
            .printType()
            .randomBackground()
            .printType()
        
        let _ = print("-----------------")
        
        Button("Not erased, though same code") {}
            .background(Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1)
            ))
            .printType()
    }
}
extension View {
    func printType() -> some View {
        let m = Mirror(reflecting: self)
        print(m.subjectType)
        return self
    }
}

#Preview {
    ObscureAnyView()
}
