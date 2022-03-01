import SwiftUI

extension View {
  /// Calls the `actionHandler` with the given `action` case. Main purpose is to make the code more readable.
  func forward<ActionType>(_ action: ActionType, to actionHandler: @escaping (ActionType) -> Void)
    -> (() -> Void)
  {
    { actionHandler(action) }
  }

  #if DEBUG
    func previewScreensWithLanguages() -> some View {
      previewScreens(
        narrowLanguage: BartyCrouch.SupportedLanguage.german.rawValue,
        spaciousLanguage: BartyCrouch.SupportedLanguage.french.rawValue
      )
    }

    func previewComponentsWithLanguages() -> some View {
      previewComponents(
        narrowLanguage: BartyCrouch.SupportedLanguage.german.rawValue,
        spaciousLanguage: BartyCrouch.SupportedLanguage.french.rawValue
      )
    }
  #endif

  @ViewBuilder
  func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }

  /* TODO: [sa_2021-06-30] The condition to be removed after
   snapshot testing library fix the shadow rendering issue, for now Apple Silicon
   machines generate snapshots that are slightly different from the ones
   generated on x86 machines (https://github.com/pointfreeco/swift-snapshot-testing/issues/424)
  */
  // AnyLint.skipInFile: All
}
