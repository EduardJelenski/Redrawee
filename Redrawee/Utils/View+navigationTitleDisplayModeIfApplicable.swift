//
//  View+navigationTitleDisplayModeIfApplicable.swift
//  Redrawee
//
//  Created by eelenskiy on 03.08.2024.
//

import SwiftUI

enum NavigationTitleDisplayMode {
    case automatic
    case inline
    case large
    
#if os(iOS)
    var nativeDisplayMode: NavigationBarItem.TitleDisplayMode {
        switch self {
            case .automatic:
                    .automatic
            case .inline:
                    .inline
            case .large:
                    .large
        }
    }
#endif
}

extension View {
    
    func navigationTitleDisplayModeIfApplicable(_ style: NavigationTitleDisplayMode) -> some View {
#if os(iOS)
        modifier(NavigationTitleDisplayModeIfApplicable(style: style.nativeDisplayMode))
#else
        self
#endif
    }
}

#if os(iOS)
struct NavigationTitleDisplayModeIfApplicable: ViewModifier {
    
    let style: NavigationBarItem.TitleDisplayMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(style)
    }
}
#endif
