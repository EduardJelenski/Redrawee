//
//  DemoView.swift
//  Redrawee
//
//  Created by eelenskiy on 06.08.2024.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        Text("Hello")
            .padding()
            .background(Color.blue)
            .printType()
        
        Text("Hi")
            .background(Color.blue)
            .padding()
            .printType()
        
        HStack {
            
        }
    }
}

#Preview {
    DemoView()
}
