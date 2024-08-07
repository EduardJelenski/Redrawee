//
//  RunloopSOExample.swift
//  Redrawee
//
//  Created by eelenskiy on 02.08.2024.
//

import SwiftUI

//@MainActor
final class RunloopSOExample: ObservableObject {
    
    @Published var value1 = false
    @Published var value2 = false
    @Published var value3 = false
    @Published var value4 = false
    @Published var value5 = false
    
    let observerRef: CFRunLoopObserver?
    let r = RunLoopObserver()
    
    init() {
        let observerRef = CFRunLoopObserverCreateWithHandler(nil,  CFRunLoopActivity.allActivities.rawValue, true, 0) { observer, activity in
//            switch activity {
//            case .entry:
//                print("entry")
//            case .
//            default:
//                break
//            }
        }
        CFRunLoopAddObserver(CFRunLoopGetMain(), observerRef, .commonModes)
        self.observerRef = observerRef
    }
    
    func toggleValues() {
        print("STARTING CHANGE")
        value1.toggle()
        value2.toggle()
        value3.toggle()
        print("SUSPRENDING CHANGE")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("CONTINUING CHANGE")
            self.value4.toggle()
            self.value5.toggle()
            print("FINISHING CHANGE")
        }
    }
}

struct RunloopSOExampleView: View {
    
    @StateObject var model = RunloopSOExample()
    
    var body: some View {
        let _ = print("REDRAW")
        VStack {
            Toggle("Something", isOn: $model.value1)
            Toggle("Something", isOn: $model.value2)
            Toggle("Something", isOn: $model.value3)
            Toggle("Something", isOn: $model.value4)
            Toggle("Something", isOn: $model.value5)
            
            Button("Change all values") {
                model.toggleValues()
            }
        }
    }
}

#Preview {
    RunloopSOExampleView()
}

import Foundation

class RunLoopObserver {
    private var observer: CFRunLoopObserver?
    
    init() {
        let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        
        var runLoopContext = CFRunLoopObserverContext(
            version: 0,
            info: context,
            retain: nil,
            release: nil,
            copyDescription: nil
        )
        
        observer = CFRunLoopObserverCreate(
            nil,
            CFRunLoopActivity.allActivities.rawValue,
            true,
            0,
            { (observer, activity, info) in
                let mySelf = Unmanaged<RunLoopObserver>.fromOpaque(info!).takeUnretainedValue()
                mySelf.runLoopDidIterate(activity)
            },
            &runLoopContext
        )
        
        if let observer = observer {
            CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, CFRunLoopMode.defaultMode)
        }
    }
    
    deinit {
        if let observer = observer {
            CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, CFRunLoopMode.defaultMode)
        }
    }
    
    private func runLoopDidIterate(_ activity: CFRunLoopActivity) {
        switch activity {
        case .entry:
            print("RunLoop entry")
        case .beforeTimers:
            print("RunLoop before timers")
        case .beforeSources:
            print("RunLoop before sources")
        case .beforeWaiting:
            print("RunLoop before waiting")
        case .afterWaiting:
            print("RunLoop after waiting")
        case .exit:
            print("RunLoop exit")
        default:
            break
        }
    }
}
