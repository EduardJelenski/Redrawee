//
//  Test.swift
//  Redrawee
//
//  Created by eelenskiy on 22.07.2024.
//

import SwiftUI

struct MyView: View {
    
    @State var str = false
    
    var body: some View {
        Test(str: $str)
            .printType()
        Toggle("123", isOn: $str)
    }
}

#Preview {
    MyView()
}
    
struct Test: View {
    
    @Binding var s: Bool
    
    init(str: Binding<Bool>) {
        _s = str
    }
    
    var body: some View {
        Text("Hello, World!")
//            .randomBackground()
            
    }
}
