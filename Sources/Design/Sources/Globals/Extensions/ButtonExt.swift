import SwiftUI

extension Button where Label == Text {
  init(
    localizedString: LocalizedString,
    action: @escaping () -> Void
  ) {
    self.init(action: action) {
      Text(LocalizedStringKey(localizedString.lookupKey), bundle: .module)
    }
  }
}
