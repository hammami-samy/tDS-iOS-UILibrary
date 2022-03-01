#!/usr/local/bin/swift-sh

import Foundation
import Files // @JohnSundell ~> 4.2
import ShellOut // @JohnSundell ~> 2.3
import HandySwift // @Flinesoft ~> 3.3

// MARK: - Input Handling

let usageInstructons: String = """

  Run like this: ./generate.swift <kind> <name>
  Replace <kind> with one of: button, component, text, widget
  Replace <name> with the name to use for your generated file(s).

  For example: ./generate.swift component ScreenLeave
  """

guard CommandLine.arguments.count == 3 else {
  print("ERROR: Wrong number of arguments. Expected 2, got \(CommandLine.arguments.count - 1).")
  print(usageInstructons)
  exit(EXIT_FAILURE)
}

enum Kind: String, CaseIterable {
  case button
  case component
  case text
  case widget
}

guard let kind = Kind(rawValue: CommandLine.arguments[1]) else {
  print("ERROR: Unknown kind '\(CommandLine.arguments[1])'. Use one of: \(Kind.allCases)")
  print(usageInstructons)
  exit(EXIT_FAILURE)
}

let name = CommandLine.arguments[2]

// MARK: - Defining File Contents

func storeFileContents(name: String) -> String {
  """
  import SwiftUI

  public struct \(name)State: Equatable {
    #warning("TODO: not yet implemented")
    public var sampleButtonTitle: LocalizedStringKey
  }

  public enum \(name)Action {
    #warning("TODO: not yet implemented")
    case sampleButtonClicked
  }

  """
}

func viewFileContents(name: String, suffix: String) -> String {
  """
  import HandySwiftUI
  import SwiftUI

  public struct \(name)\(suffix): View {
    public var state: \(name)State
    public var actionHandler: (\(name)Action) -> Void

    public init(
      state: \(name)State,
      actionHandler: @escaping (\(name)Action) -> Void
    ) {
      self.state = state
      self.actionHandler = actionHandler
    }

    public var body: some View {
      #warning("TODO: not yet implemented")
      Button(state.sampleButtonTitle, action: forward(action: .sampleButtonClicked, to: actionHandler))
    }
  }

  #if DEBUG
    struct \(name)\(suffix)_Previews: PreviewProvider {
      static let state = \(name)State(
        sampleButtonTitle: "\(name)"
      )

      static var previews: some View {
        \(name)\(suffix)(state: state, actionHandler: { _ in })
          .previewComponentsWithLanguages()
      }
    }
  #endif

  """
}

// MARK: - Generating Code Files

switch kind {
    
case .component:
  let folder = try Folder(path: "Sources/Design/Sources/Component")

  let storeFile = try folder.createFile(named: "\(name)Store.swift")
  try storeFile.write(storeFileContents(name: "\(name)"))
  print("Successfully generated file: \(storeFile.path)")

  let viewFile = try folder.createFile(named: "\(name)View.swift")
  try viewFile.write(viewFileContents(name: name, suffix: "View"))
  print("Successfully generated file: \(viewFile.path)")

case .text:
  let folder = try Folder(path: "Sources/Design/Sources/Text")

  let storeFile = try folder.createFile(named: "\(name)Store.swift")
  try storeFile.write(storeFileContents(name: "\(name)"))
  print("Successfully generated file: \(storeFile.path)")

  let viewFile = try folder.createFile(named: "\(name)View.swift")
  try viewFile.write(viewFileContents(name: name, suffix: "View"))
  print("Successfully generated file: \(viewFile.path)")

case .widget:
  let folder = try Folder(path: "Sources/Design/Sources/Widget")

  let storeFile = try folder.createFile(named: "\(name)Store.swift")
  try storeFile.write(storeFileContents(name: "\(name)"))
  print("Successfully generated file: \(storeFile.path)")

  let viewFile = try folder.createFile(named: "\(name)View.swift")
  try viewFile.write(viewFileContents(name: name, suffix: "View"))
  print("Successfully generated file: \(viewFile.path)")
}


