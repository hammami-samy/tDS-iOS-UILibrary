import HandySwiftUI
import SwiftUI
import SFSafeSymbols

public struct CButton: View {
    public var state: ButtonState
    public var actionHandler: (CButtonAction) -> Void
    
    public init(
        state: ButtonState,
        actionHandler: @escaping (CButtonAction) -> Void
    ) {
        self.state = state
        self.actionHandler = actionHandler
    }
    
    public var body: some View {
        switch state.variant {
        case .primary:
            setupView(
                variant: BaseButtonStyle.Variant.filled,
                size: state.size,
                iconColor: Clr.Neutrals.trvwhite,
                text: L10n.buttonSample,
                haveShadow: false,
                isEnabled: state.isEnabled,
                trailingIcon: state.trailingIcon,
                leadingIcon: state.leadingIcon,
                fullwidth: state.fullWidth
            )
            
        case .secondary:
            setupView(
                variant: BaseButtonStyle.Variant.filled,
                size: state.size,
                iconColor: Clr.Neutrals.trvwhite,
                text: L10n.buttonSample,
                haveShadow: false,
                isEnabled: state.isEnabled,
                trailingIcon: state.trailingIcon,
                leadingIcon: state.leadingIcon,
                fullwidth: state.fullWidth
            )
            
        case .tertiary:
            setupView(
                variant: BaseButtonStyle.Variant.filled,
                size: state.size,
                iconColor: Clr.Neutrals.trvwhite,
                text: L10n.buttonSample,
                haveShadow: false,
                isEnabled: state.isEnabled,
                trailingIcon: state.trailingIcon,
                leadingIcon: state.leadingIcon,
                fullwidth: state.fullWidth
            )
            
        case .fab:
            setupView(
                variant: BaseButtonStyle.Variant.filled,
                size: state.size,
                iconColor: Clr.Neutrals.trvwhite,
                text: L10n.buttonSample,
                haveShadow: true,
                isEnabled: state.isEnabled,
                trailingIcon: state.trailingIcon,
                leadingIcon: state.leadingIcon,
                fullwidth: true
            )
        }
    }
    
    private func setupView(
        variant: BaseButtonStyle.Variant,
        size: BaseButtonStyle.Size,
        iconColor: Color,
        text: LocalizedString,
        haveShadow: Bool,
        isEnabled: Bool,
        trailingIcon: Image?,
        leadingIcon: Image?,
        fullwidth: Bool) -> some View {
            Button(action: forward(.pressed, to: actionHandler)) {
                HStack (spacing: 12) {
                    trailingIcon.foregroundColor(iconColor)
                    Text(localizedString: text)
                    leadingIcon.foregroundColor(iconColor)
                }
            }
            .if(!isEnabled) {
                $0.foregroundColor(Clr.TrvJuri.trv200)
            }
            .buttonStyle(BaseButtonStyle(size: size, variant: variant, contentMode: fullwidth ? BaseButtonStyle.ContentMode.fill : BaseButtonStyle.ContentMode.fit))
            .if(haveShadow) {
                $0.shadow(
                    color: Clr.TrvJuri.trv900,
                    radius: 10,
                    x:0,
                    y: 4
                )
            }
            .if(!isEnabled) {
                $0.background(Clr.TrvJuri.trv200)
            }
            .disabled(!isEnabled)
            
            
        }
}

#if DEBUG
struct FormButton_Previews: PreviewProvider {
    static let state = ButtonState(
        label: L10n.buttonSample,
        variant: .primary,
        fullWidth: true,
        size: BaseButtonStyle.Size.regular)
    
    static var previews: some View {
        CButton(state: state, actionHandler: { _ in })
            .previewComponentsWithLanguages()
    }
}
#endif
