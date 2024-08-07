//
//  TestViewBuilderOnLargeData.swift
//  Redrawee
//
//  Created by eelenskiy on 04.08.2024.
//

import SwiftUI


final class ModelObj: ObservableObject {
        
    @Published var hello = (0..<10_000).map { int in
        (int, String(int))
    }
}

struct TestViewBuilderOnLargeData: View {
    
    @EnvironmentObject var m: ModelObj
    
    @State var scrollId: String? = nil
    
    var body: some View {
        Button("Scroll To") {
            withAnimation {
                scrollId = m.hello.last?.1
            }
        }
        ScrollView {
            LazyVStack {
                ForEach(m.hello, id: \.1.self) { data in
                    if data.0 % 2 == 0 {
                        VStack {
                            Button(data.1) {}
                            Text(data.1)
                                .background(.red)
                        }
                    } else {
                        VStack {
                            Label(data.1, systemImage: "applelogo")
                            Text(data.1)
                                .background(.blue)
                        }
                    }
                }
            }
        }
        .scrollPosition(id: $scrollId)
    }
}

struct TestTernaryOnLargeData: View {
    
    @EnvironmentObject var m: ModelObj
    
    @State var scrollId: String? = nil
    
    var body: some View {
        Button("Scroll To") {
            withAnimation {
                scrollId = m.hello.last?.1
            }
        }
        ScrollView {
            LazyVStack {
                ForEach(m.hello, id: \.1.self) { data in
                    Text(data.1)
                        .background(data.0 % 2 == 0 ? .red : .blue)
                }
            }
        }
        .scrollPosition(id: $scrollId)
    }
}

#Preview {
    TestViewBuilderOnLargeData()
}
