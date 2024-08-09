//
//  AccessibilityIdentifierBranchModifier.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

import SwiftUI

// MARK: The branch modifier takes a branch from a parent View and appends to it the branch provided in the constructor.

public struct AccessibilityIdentifierBranchModifier: ViewModifier {
    @Environment(\.parentAccessibilityBranch) private var parentBranch

    private let branch: String

    public init(branch: String) {
        self.branch = branch
    }

    public func body(content: Content) -> some View {
        content
            .environment(\.parentAccessibilityBranch, makeGroupPath())
    }

    private func makeGroupPath() -> String {
        guard let parentBranch = parentBranch else { return branch }
        return "\(parentBranch).\(branch)"
    }
}

public extension View {
    func accessibilityIdentifierBranch(_ branch: String) -> ModifiedContent<Self, AccessibilityIdentifierBranchModifier> {
        modifier(AccessibilityIdentifierBranchModifier(branch: branch))
    }
}
