// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

extension Font {
  public static func proximaNova(_ style: ProximaNovaStyle, fixedSize: CGFloat) -> Font {
    return Font.custom(style.rawValue, fixedSize: fixedSize)
  }

  public static func proximaNova(_ style: ProximaNovaStyle, size: CGFloat, lineSpacing: CGFloat) -> Font {
    return Font.custom(style.rawValue, size: size)
  }

  public enum ProximaNovaStyle: String {
    case bold = "ProximaNova-Bold"
    case regular = "ProximaNova-Regular"
    case semibold = "ProximaNova-Semibold"
  }
}
