import SwiftUI

public struct ButtonState {
    public var label: LocalizedString
    public var variant: Variant
    public var leadingIcon: Image?
    public var trailingIcon: Image?
    public var fullWidth: Bool
    public var isEnabled: Bool
    public var size: BaseButtonStyle.Size
    
    public init(
        label: LocalizedString,
        variant: Variant,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        fullWidth: Bool = false,
        isEnabled: Bool = true,
        size: BaseButtonStyle.Size
    ) {
        self.label = label
        self.variant = variant
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.fullWidth = fullWidth
        self.isEnabled = isEnabled
        self.size = size
    }
}

public enum Variant {
    case primary
    case secondary
    case tertiary
    case fab
}

public enum CButtonAction {
    case pressed
}
