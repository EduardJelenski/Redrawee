//
//  TestPassingDown.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

//struct First: View {
//    
//    @State var value = true
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: "phone.circle")
//                Toggle("Change valye", isOn: $value)
//                    .toggleStyle(.button)
//            }
//            Second()
//                .environment(\.myCustomValue, value)
//        }
//        .padding()
//        .background(.random())
//    }
//}
//
//struct Second: View {
//    
////    @Environment(\.myCustomValue) var unused: Bool
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "phone.down.circle")
//            Third()
////                .environment(\.myCustomValue, unused)
//        }
//        .padding()
//        .background(.random())
//    }
//}
//
//struct Third: View {
//    
//    @Environment(\.myCustomValue) var usedValue: Bool
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "iphone.gen1.circle")
//            Text("Current value is \(usedValue)")
//        }
//        .padding()
//        .background(.random())
//    }
//}
//
//#Preview {
//    First()
//}
//
//private struct MyEnvironmentKey: EnvironmentKey {
//    static let defaultValue: Bool = false
//}
//
//
//extension EnvironmentValues {
//    var myCustomValue: Bool {
//        get { self[MyEnvironmentKey.self] }
//        set { self[MyEnvironmentKey.self] = newValue }
//    }
//}
