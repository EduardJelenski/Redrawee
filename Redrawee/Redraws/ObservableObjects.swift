//
//  ObservableObjects.swift
//  Redrawee
//
//  Created by eelenskiy on 02.08.2024.
//

import SwiftUI

struct ObservableObjectsExample: View {
    
    @State var value = true
    
    var body: some View {
        let _ = Self._printChanges()
        ObservedObjectExample()
            
        StateObjectExample()
        
        EnvironementObjectExample()
            .environmentObject(ModelObject())
            
        
        Toggle("Container value", isOn: $value)
    }
}

#Preview {
    ObservableObjectsExample()
}

final class ModelObject: ObservableObject {
    @Published var value = true
    
    deinit {
        fatalError()
    }
}

struct ObservedObjectExample: View {
    
    @ObservedObject var model = ModelObject()
    
    var body: some View {
        let _ = Self._printChanges()
        Toggle("Observed Object", isOn: $model.value)
            .randomBackground()
    }
}

struct EnvironementObjectExample: View {
    
    @EnvironmentObject var model: ModelObject
    
    var body: some View {
        let _ = Self._printChanges()
        Toggle("State Object", isOn: $model.value)
            .randomBackground()
    }
}

struct StateObjectExample: View {
    
    @StateObject var model = ModelObject()
    
    var body: some View {
        let _ = Self._printChanges()
        Toggle("State Object", isOn: $model.value)
            .randomBackground()
    }
}
