import SnapshotTesting
import SwiftUI
import XCTest

@testable import Design

final class ButtonTests: XCTestCase {
    func testFormButton() {
        var view = CButton( state: ButtonState(
            label: L10n.buttonSample,
            variant: .primary,
            leadingIcon: Img.Icons.Content.comment24x24Fill,
            size: .regular),
                            actionHandler: { _ in }
        )
        assertScreenshot(variant: "Setup", view: view, width: 200, height: 30,record: true)
        
        view.state.variant = .secondary
        view.state.label = L10n.buttonSample
        assertScreenshot(variant: "Secondary", view: view, width: 400, height: 50,record: true)
        
        view.state.variant = .tertiary
        view.state.label = L10n.buttonSample
        assertScreenshot(variant: "Tertiary", view: view, width: 400, height: 50,record: true)
    }
}
