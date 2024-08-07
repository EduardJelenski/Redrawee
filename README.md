# 🛠️ Development in progress

#  Redrawee — Investigating SwiftUI Views Redrawing Patterns

An iOS app that investigates effects of using different approaches in building view hierarchies and state managment on views redraws:

- Extraction of subviews into a separate structs and view modifying methods into view modifiers
- Usage of `@ViewBuilder` and its underlying `_ConditionalContent` view
- Passing values down the hierarchy through @Binding and through @Environment
- `.id(_:)` modifier 
- Conforming your views to `Equatable` protocol and usage of `.equatable()` modifier 
- Comparison of `ObservableObject` and `@Observable` approaches 

By Eduard Jeleński, 2024

[SwiftUI Views Redrawing Patterns app on GitHub](https://github.com/EduardJelenski/Redrawee>)<br>

## Usage

1. Open the project in Xcode.
2. Run the app on the iOS simulator, an iOS device.
3. Click through the list of examples, conduct the experiment and explore the explanation down below.

## Requirements

Requires iOS 17.

## Screenshots

### iPhone

[comment]: <img src="assets/ios-collage.png" width="692" height="339"/>

## License

[MIT license](LICENSE.md)
