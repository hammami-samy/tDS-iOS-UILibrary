#!/bin/bash
set -euxo pipefail

bartycrouch update
bartycrouch lint
swiftgen
swift-format --recursive Sources/Design/Sources Tests/DesignTests lint.swift --in-place
swift-format lint --recursive Sources/Design/Sources Tests/DesignTests lint.swift
anylint
