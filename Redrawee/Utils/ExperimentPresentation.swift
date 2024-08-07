//
//  ExperimentPresentation.swift
//  Redrawee
//
//  Created by eelenskiy on 03.08.2024.
//

import SwiftUI

struct ExperimentPresentation<Experiment: View, Explanation: View>: View {
    
    let experiment: Experiment
    let explanation: Explanation
    
    init(@ViewBuilder experiment: () -> Experiment, @ViewBuilder explanation: () -> Explanation) {
        self.experiment = experiment()
        self.explanation = explanation()
    }
    
    var body: some View {
        #if os(iOS)
            iOSExperimentPresentation(
                experiment: { experiment },
                explanation: { explanation }
            )
        #else
            MacOSExperimentPresentation(
                experiment: { experiment },
                explanation: { explanation }
            )
        #endif
    }
}

private struct iOSExperimentPresentation<Experiment: View, Explanation: View>: View {
    
    let experiment: Experiment
    let explanation: Explanation
    
    init(@ViewBuilder experiment: () -> Experiment, @ViewBuilder explanation: () -> Explanation) {
        self.experiment = experiment()
        self.explanation = explanation()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Experiment")
                .font(.system(size: 24, weight: .semibold, design: .default))
            experiment
            Text("Explanation")
                .font(.system(size: 24, weight: .semibold, design: .default))
            explanation
        }
        .padding()
    }
}


private struct MacOSExperimentPresentation<Experiment: View, Explanation: View>: View {
    
    let experiment: Experiment
    let explanation: Explanation
    
    init(@ViewBuilder experiment: () -> Experiment, @ViewBuilder explanation: () -> Explanation) {
        self.experiment = experiment()
        self.explanation = explanation()
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Experiment")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                experiment
            }
            VStack(alignment: .leading, spacing: 16) {
                Text("Explanation")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                explanation
            }
        }
        .padding()
    }
}

#Preview(body: {
    ExperimentPresentation(
        experiment: {
            Text("Text with Icon added through method")
                .iconThroughMethod()
            
            Text("Text with Icon added through modifier")
                .iconThroughModifier()
            
            Toggle("Change value", isOn: .constant(true))
                .toggleStyle(.button)
        }, explanation: {
            Text(
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
        """
            )
            
            Spacer()
        })
})
