//
//  ForEachBindingTest.swift
//  Redrawee
//
//  Created by eelenskiy on 25.07.2024.
//

import SwiftUI

struct Model: Identifiable {
    let id = UUID()
    var name: String
}

struct ForEachBindingTest: View {
    
    @State var elements: [Model]
    
    init() {
        _elements = .init(initialValue: (0..<15).map {
            Model(name: String($0))
        })
    }
    
    var body: some View {
//        ScrollView {
            List($elements) { $element in
                TextF(text: $element.name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .randomBackground()
            }
//        }
            .padding()
    }
}

struct TextF: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
    }
}

#Preview {
    ForEachBindingTest()
}
