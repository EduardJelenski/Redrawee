//
//  TestObservableBranch.swift
//  Redrawee
//
//  Created by eelenskiy on 29.07.2024.
//

import SwiftUI

@Observable
class Obs {
    let value1 = false
    var value2 = false
}

class OO: ObservableObject {
    @Published var value1 = false
    @Published var value2 = false
}

struct TestObservableBranch: View {
    
//    @Bindable 
    var obs = Obs()
    @StateObject var oo = OO()
    @State var stateValue = true
    
    var body: some View {
        if obs.value1 {
            Rectangle()
                .fill(.red)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding()
                .randomBackground()
        } else {
            Rectangle()
                .fill(.blue)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding()
                .randomBackground()
        }
        
        
        Toggle("Visibility", isOn: $stateValue)
        Button("Color Obs V1") {
//            obs.value1.toggle()
        }
        Button("Color Obs V2") {
            obs.value2.toggle()
        }
        Toggle("Color OO v1", isOn: $oo.value1)
        Toggle("Color OO v2", isOn: $oo.value2)
    }
}

#Preview {
    TestObservableBranch()
}
