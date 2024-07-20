//
//  ObservationDemo.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

@Observable
final class Student {
   var name: String = ""
   var hasAssignments: Bool


   init(name: String, hasAssignments: Bool) {
       self.name = name
       self.hasAssignments = hasAssignments
   }
}

struct ObservationDemo: View {
    
    @State var student = Student(name: "Eduard", hasAssignments: true)
    
    var body: some View {
        Text(student.name)
            .padding()
            .debug()
        Text("Has assignments: \(student.hasAssignments)")
            .padding()
            .debug()
        
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

#Preview {
    ObservationDemo()
}
