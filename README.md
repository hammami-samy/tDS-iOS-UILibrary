# tDS-iOS-UILibrary

The shiny new shared Design library for iOS. ✨

## Getting Started

First, make sure you have the required tools installed:

- [BartyCrouch](https://github.com/Flinesoft/BartyCrouch): `brew install bartycrouch`
- [Swift-SH](https://github.com/mxcl/swift-sh): `brew install swift-sh`
- [AnyLint](https://github.com/Flinesoft/AnyLint): `brew tap Flinesoft/AnyLint https://github.com/Flinesoft/AnyLint.git && brew install anylint`
- [Mint](https://github.com/yonaskolb/Mint): `brew install mint`
- [Swift-Format](https://github.com/apple/swift-format): `mint install apple/swift-format`

Then, double-click the `Package.swift` file to open the project in Xcode (Xcode needs to be installed, of course).

As Swift packages don't support build scripts, there's a `build-script.sh` file which you should run from time to time during development to get the same effects as with a build script:

```bash
./build-script.sh
```
