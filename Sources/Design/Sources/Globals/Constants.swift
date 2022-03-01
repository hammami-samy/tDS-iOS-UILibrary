import SwiftUI

enum Constants {
    static let tiny: CGFloat = 2
    static let extraSmall: CGFloat = 4
    static let small: CGFloat = 8
    static let medium: CGFloat = 12
    static let normal: CGFloat = 16
    static let large: CGFloat = 24
    static let extraLarge: CGFloat = 32
    static let huge: CGFloat = 64
}

// Spacing used between layout elements using 4dp Grid.
enum Spacing {
  static let tiny: CGFloat = 2
  static let extraSmall: CGFloat = 4
  static let small: CGFloat = 8
  static let medium: CGFloat = 12
  static let normal: CGFloat = 16
  static let large: CGFloat = 24
  static let extraLarge: CGFloat = 32
  static let huge: CGFloat = 64
}

// Parent layout padding (Safe area).
enum Padding {
  static let parentHorizontal: CGFloat = Spacing.normal
  static let parentVertical: CGFloat = Spacing.normal
  static let tiny: CGFloat = 4
  static let small: CGFloat = 6
  static let medium: CGFloat = 12
  static let normal: CGFloat = 20
  static let large: CGFloat = 30
}

// Components, buttons and texts default margin.
enum Margin {
  static let component: CGFloat = Spacing.normal
  static let text: CGFloat = Spacing.small
  static let button: CGFloat = Spacing.normal
}

// Radius.
enum Radius {
  static let small: CGFloat = 4
  static let medium: CGFloat = 6
  static let large: CGFloat = 8
  static let extraLarge: CGFloat = 16
  static let extraExtraLarge: CGFloat = 25
}

// Emphasis modifiers for "on" colors.
enum AlphaEmphasis {
  static let high: Double = 0.87
  static let medium: Double = 0.6
  static let disabled: Double = 0.38
}

// Define the shadow size.
enum ShadowRadius {
  static let tiny: CGFloat = 2
  static let xSmall: CGFloat = 4
  static let small: CGFloat = 8
  static let medium: CGFloat = 16
  static let large: CGFloat = 24
}
