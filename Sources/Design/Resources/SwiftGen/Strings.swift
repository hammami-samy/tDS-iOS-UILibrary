// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// MARK: - Strings

public enum L10n {
  /// Button Sample
  public static let buttonSample = LocalizedString(lookupKey: "button_sample")
  public enum AssistantInfoView {
    /// Hallo %@!
    public static func greetingText(_ p1: Any) -> String {
      return L10n.tr("Localizable", "assistant_info_view.greeting_text", String(describing: p1))
    }
  }
}

// MARK: - Implementation Details

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

public struct LocalizedString {
  internal let lookupKey: String

  var key: LocalizedStringKey {
//    LocalizedStringKey(lookupKey)
    LocalizedStringKey(L10n.tr("Localizable", lookupKey))
  }

  var text: String {
    L10n.tr("Localizable", lookupKey)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
      return Bundle.module
    #else
      return Bundle(for: BundleToken.self)
    #endif
  }()
}
