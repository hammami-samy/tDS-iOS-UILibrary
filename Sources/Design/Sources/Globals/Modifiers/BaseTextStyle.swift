import HandySwiftUI
import SwiftUI

public enum BaseTextStyle {
    case caption1
    case caption2
    case footnote1
    case footnote2
    case footnote3
    case footnote4
    case body
    case subhead3
    case subhead2
    case subhead1
    case title1
    case title2
    case title3
    case headline2
    case headline1
}

extension View {
  public func textStyle(_ textStyle: BaseTextStyle) -> some View {
      font(.textStyle(textStyle)).eraseToAnyView()
    }
  }
