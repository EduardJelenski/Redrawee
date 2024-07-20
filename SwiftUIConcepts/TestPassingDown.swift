//
//import SwiftUI
//
//struct First: View {
//    
//    @State var value = true
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: "phone.circle")
//                Toggle("Change valye", isOn: $value)
//                    .toggleStyle(.button)
//            }
//            Second(unused: $value)
//        }
//        .padding()
//        .background(.random())
//    }
//}
//
//struct Second: View {
//    
//    @Binding var unused: Bool
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "phone.down.circle")
//            Third(usedValue: $unused)
//        }
//        .padding()
//        .background(.random())
//    }
//}
//
//struct Third: View {
//    
//    @Binding var usedValue: Bool
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "iphone.gen1.circle")
//            Text("Current value is \(usedValue)")
//        }
//        .padding()
//        .background(.random())
//    }
//}
//
//#Preview {
//    First()
//}
