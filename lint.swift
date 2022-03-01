import AnyLint  // @Flinesoft

try Lint.logSummaryAndExit(arguments: CommandLine.arguments) {
  // MARK: - Variables
  let sourceFiles: Regex = #"^(Sources|Tests)/Design(Tests)?/.*\.swift$"#
  let resourceFiles: Regex = #"^(Sources|Tests)/Design(Tests)?/Resources/.*\.swift$"#
  let stringsFiles: Regex = #"^Sources/Design/Resources/Localizations/.*\.lproj/.*\.strings$"#

  // MARK: - Checks
  // MARK: SafeColors
  try Lint.checkFileContents(
    checkInfo:
      "SafeColors: Use the safe SwiftGen resources via the initializer instead, e.g. `Clr.Fill.primary`",
    regex: #"\WColor\((?!clr:).*"#,
    matchingExamples: [#" Color("Fill/Primary")"#, "color: Color(.red)"],
    nonMatchingExamples: [" Clr.Fill.primary", "color: randomColor()"],
    includeFilters: [sourceFiles],
    excludeFilters: [resourceFiles]
  )

  // MARK: SafeImages
  try Lint.checkFileContents(
    checkInfo:
      "SafeImages: Use the safe SwiftGen resources via the initializer instead, e.g. `Img.Onboarding.header`",
    regex: #"\WImage\((?!img:|systemSymbol:).*"#,
    matchingExamples: [#" Image("Onboarding/Header")"#, "image: Image()"],
    nonMatchingExamples: [
      " Img.Onboarding.header", " Image(systemSymbol:)", "image: randomImage()",
    ],
    includeFilters: [sourceFiles],
    excludeFilters: [resourceFiles]
  )

  // MARK: TextStyle
  try Lint.checkFileContents(
    checkInfo:
      "TextStyle: Use `.textStyle` instead of `.font` to adhere to the design system.",
    regex: #"\.font\(.*"#,
    matchingExamples: [
      "Text(L10n.some.key)\n  .font(.caption)", "Text(L10n.some.key).font(Font.system(size: 15))",
    ],
    includeFilters: [sourceFiles],
    excludeFilters: [#"^Sources/Design/.*/BaseTextStyle\.swift$"#, resourceFiles]
  )
}
