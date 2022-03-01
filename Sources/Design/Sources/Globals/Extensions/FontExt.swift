import SwiftUI

extension Font {
  public enum RubricWeight {
    case regular
    case semibold
    case bold

    public var fontWeight: Font.Weight {
      switch self {
      case .regular:
        return .regular

      case .semibold:
        return .semibold

      case .bold:
        return .bold
      }
    }
  }

  static func textStyle(_ textStyle: BaseTextStyle) -> Font {
    switch textStyle {
    case .caption1:
        return .proximaNova(.regular, size: 10, lineSpacing: 12)

    case .caption2:
        return .proximaNova(.bold, size: 10, lineSpacing: 15)

    case .body:
        return .proximaNova(.regular, size: 15, lineSpacing: 30)

    case .footnote1:
        return .proximaNova(.bold, size: 13, lineSpacing: 25)

    case .footnote2:
        return .proximaNova(.regular, size: 13, lineSpacing: 22)

    case .footnote3:
        return .proximaNova(.semibold, size: 13, lineSpacing: 20)

    case .footnote4:
        return .proximaNova(.regular, size: 13, lineSpacing: 18)

    case .subhead3:
        return .proximaNova(.semibold, size: 15, lineSpacing: 35)

    case .subhead2:
        return .proximaNova(.bold, size: 15, lineSpacing: 40)

    case .subhead1:
        return .proximaNova(.regular, size: 17, lineSpacing: 50)

    case .title1:
        return .proximaNova(.bold, size: 20, lineSpacing: 70)

    case .title2:
        return .proximaNova(.semibold, size: 17, lineSpacing: 70)

    case .title3:
        return .proximaNova(.bold, size: 17, lineSpacing: 60)

    case .headline2:
        return .proximaNova(.bold, size: 24, lineSpacing: 70)

    case .headline1:
        return .proximaNova(.bold, size: 28, lineSpacing: 70)
    }
  }

  /// Decides between .semibold and .regular styles and also takes italic styles into considerations.
  private static func proximaNovaStyle(rubricWeight: RubricWeight) -> ProximaNovaStyle {
    switch rubricWeight {
    case .bold:
      return .bold

    case .semibold:
      return .regular

    case .regular:
      return .regular
    }
  }
}
