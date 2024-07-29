//
//  ObservationDemo.swift
//  Redrawee
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

@Observable
final class St {
   var name: String = ""
   var hasAssignments: Bool


   init(name: String, hasAssignments: Bool) {
       self.name = name
       self.hasAssignments = hasAssignments
   }
}

final class StOO: ObservableObject {
   @Published var name: String = ""
   @Published var hasAssignments: Bool


   init(name: String, hasAssignments: Bool) {
       self.name = name
       self.hasAssignments = hasAssignments
   }
}

struct ObservationDemo: View {
    
//    @State var student = St(name: "Eduard", hasAssignments: true)
    @StateObject var student = StOO(name: "Eduard", hasAssignments: true)
    
    var body: some View {
        StudentName(name: student.name)
        
        HasAssigView(hasAssignments: student.hasAssignments)
        
        Button("Change name") {
            student.name = "Masha"
            
        }
        .padding()
        
        Button("Change assignments status") {
            student.hasAssignments.toggle()
            
        }
        .padding()
    }
}

struct StudentName: View {
    
    let name: String
    
    var body: some View {
        Text(name)
            .padding()
            .randomBackground()
    }
}

struct HasAssigView: View {
    
    let hasAssignments: Bool
    
    var body: some View {
        Text("Has assignments: \(hasAssignments)")
            .padding()
            .randomBackground()
    }
}

#Preview {
    ObservationDemo()
}

