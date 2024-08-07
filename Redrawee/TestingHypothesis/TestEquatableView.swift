//
//  EquatableModifier.swift
//  Redrawee
//
//  Created by eelenskiy on 20.07.2024.
//

// проверить что будет, если прокинуть STate, Binding в инит, но не использовать их — будут ли перерисовки

// https://swiftui-lab.com/equatableview/
// https://fatbobman.com/en/posts/avoid_repeated_calculations_of_swiftui_views/
// https://www.donnywals.com/understanding-how-and-when-swiftui-decides-to-redraw-views/
// https://t.me/contravariance/54

import SwiftUI

struct EquatableReceiverView: View/*, Equatable*/ {
//    static func == (lhs: EquatableReceiverView, rhs: EquatableReceiverView) -> Bool {
//        lhs.value == rhs.value
//    }

    let value: String
    let v: Bool
    
    var body: some View {
        Text("Current value is")// \(value)")
            .padding()
            .randomBackground()
    }
    
    
}

struct EquatableModifier: View {
    
    @State var value = "123"
    @State var v = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Experiment")
                .font(.system(size: 24, weight: .semibold, design: .default))
        
            EquatableReceiverView(value: value, v: v)
//                .equatable()
                
            TextField("Value", text: $value)
                .textFieldStyle(.roundedBorder)
            Toggle("v", isOn: $v)
            
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
    
    var nonExtractedView: some View {
        VStack {
            Text("Non-extracted View Label")
            Image(systemName: "shippingbox.and.arrow.backward")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .randomBackground()
    }
}

#Preview {
    NavigationStack {
        EquatableModifier()
            .navigationTitle("Equatable View")
//            .navigationTitleDisplayModeIfApplicable(.inline)
    }
}
