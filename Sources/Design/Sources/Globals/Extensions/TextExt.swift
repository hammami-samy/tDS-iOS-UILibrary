import SwiftUI

extension Text {
  init(
    localizedString: LocalizedString
  ) {
    self.init(LocalizedStringKey(localizedString.lookupKey), bundle: .module)
  }
}
