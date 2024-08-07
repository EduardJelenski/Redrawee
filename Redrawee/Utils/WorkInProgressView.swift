//
//  WorkInProgressView.swift
//  Redrawee
//
//  Created by eelenskiy on 07.08.2024.
//

import SwiftUI

struct WorkInProgressView: View {
    
    @State private var hammerRotationDegrees = 30.0
    @State private var gearRotationDegrees = 0.0
    @State private var wrenchRotationDegrees = 15.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Work In Progress")
                .bold()
            
            VStack(spacing: 0) {
                
                Text("🔨")
                    .rotationEffect(.degrees(hammerRotationDegrees), anchor: .bottomTrailing)
                    .offset(x: 25.0, y: 0)
                    .onAppear {
                        withAnimation(hammerHitsAnimation) {
                            hammerRotationDegrees = -30
                        }
                    }
                
                Text("⚙️")
                    .rotationEffect(.degrees(gearRotationDegrees))
                    .onAppear {
                        withAnimation(gearRotationAnimation) {
                            gearRotationDegrees = 360
                        }
                    }
                
                Text("🔧")
                    .scaleEffect(CGSize(width: -1.0, height: 1.0))
                    .rotationEffect(.degrees(wrenchRotationDegrees), anchor: .topTrailing)
                    .offset(x: -25, y: -5)
                    .onAppear {
                        withAnimation(wrenchRotationAnimation) {
                            wrenchRotationDegrees = -15
                        }
                    }
            }
        }
        .font(.largeTitle)
    }
    
    private let hammerHitsAnimation: Animation = {
        .bouncy
        .speed(2)
        .repeatForever(autoreverses: true)
    }()
    
    private let wrenchRotationAnimation: Animation = {
        .bouncy
        .speed(2)
        .repeatForever(autoreverses: true)
    }()
    
    private let gearRotationAnimation: Animation = {
        .linear
        .speed(0.1)
        .repeatForever(autoreverses: false)
    }()
}

#Preview {
    WorkInProgressView()
}
