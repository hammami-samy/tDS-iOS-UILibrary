import SwiftUI

public struct BaseButtonStyle: ButtonStyle {
    public enum Size: CaseIterable {
        case regular
        case medium
    }
    
    public enum Variant: CaseIterable {
        case filled
        case outlined
        case text
    }
    
    /// The expected behavior for the buttons width.
    public enum ContentMode: CaseIterable {
        /// Fill the entire space available in the context.
        case fill
        
        /// Fit the button to the text contents.
        case fit
    }
    
    let size: Size
    let variant: Variant
    let contentMode: ContentMode
    
    public init(
        size: Size = .regular,
        variant: Variant,
        contentMode: ContentMode = .fit
    ) {
        self.size = size
        self.variant = variant
        self.contentMode = contentMode
    }
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .textStyle(textStyle)
            .lineLimit(1)
            .minimumScaleFactor(3)
            .padding([.trailing, .leading], padding)
            .applyIf(contentMode == .fill) {
                $0.frame(minWidth: 0, maxWidth: .infinity)
            }
            .frame(height: height)
            .background(background(configuration))
            .cornerRadius(cornerRadius)
            .foregroundColor(foregroundColor(configuration))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(borderColor, lineWidth: borderWidth)
            )
           
    }
    
    private var textStyle: BaseTextStyle {
        switch variant {
        case .outlined:
            return .subhead2
            
        case .filled:
            return .subhead2
            
        case .text:
            return .subhead1
        }
    }
    
    private func background(_ configuration: Configuration) -> Color {
        switch variant {
        case .filled:
            return configuration.isPressed
            ? Clr.TrvBlue.trv900
            : Clr.TrvBlue.trv700
            
        case .outlined:
            return configuration.isPressed
            ? Clr.TrvGreen.trv100
            : Color.clear
            
        case .text:
            return configuration.isPressed
            ? Color.clear
            : Color.clear
        }
    }
    
    private func foregroundColor(_ configuration: Configuration) -> Color {
        switch variant {
        case .filled:
            return Color.white
            
        case .outlined:
            return configuration.isPressed ? Clr.TrvGreen.trv900  : Clr.TrvGreen.trv700
            
        case .text:
            return configuration.isPressed ? Clr.TrvGreen.trv900  : Clr.TrvGreen.trv700
        }
    }
    
    private var borderColor: Color {
        switch variant {
        case .filled:
            return .clear
            
        case .outlined:
            return Clr.TrvGreen.trv700
            
        case .text:
            return Color.clear
        }
    }
    
    private var borderWidth: CGFloat {
        return 1.5
    }
    
    private var height: CGFloat {
        switch size {
        case .regular:
            return 48
            
        case .medium:
            return 44
            
        }
    }
    
    private var cornerRadius: CGFloat {
        return 4
    }
    
    private var padding: CGFloat {
        switch size {
        case .regular:
            return 24
            
        case .medium:
            return 16
        }
    }
}

#if DEBUG
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Primary button", action: {})
                .buttonStyle(BaseButtonStyle(size: .regular, variant: .filled))
            
            Button("Secondary button", action: {})
                .buttonStyle(BaseButtonStyle(size: .medium, variant: .outlined, contentMode: .fill))
            Button("Tertiary buttton", action: {})
                .buttonStyle(BaseButtonStyle(size: .medium, variant: .text, contentMode: .fill))
        }
        .padding()
        .previewComponentsWithLanguages()
    }
}
#endif
