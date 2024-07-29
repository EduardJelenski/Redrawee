//
//  FBM.swift
//  Redrawee
//
//  Created by eelenskiy on 22.07.2024.
//

import SwiftUI

struct Student {
    var name: String
    var age: Int
}

struct RootView: View {
    @State var student = Student(name: "fat", age: 88)
    var body: some View {
        VStack {
            StudentNameView(student: student)
            StudentAgeView(student: student)
            Button("random age") {
                student.age = Int.random(in: 0...99)
            }
            .onAppear {
                print(Thread.current)
            }
            .task {
                NSLog("", "")
            }
        }
    }
}

struct StudentNameView: View, Equatable {
    let student: Student
    var body: some View {
        let _ = Self._printChanges()
        Text(student.name)
            .padding()
            .randomBackground()
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.student.name == rhs.student.name
    }
}

struct StudentAgeView: View, Equatable {
    let student: Student
    var body: some View {
        let _ = Self._printChanges()
        Text(student.age, format: .number)
            .padding()
            .randomBackground()
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.student.age == rhs.student.age
    }
}

#Preview {
    RootView()
}
