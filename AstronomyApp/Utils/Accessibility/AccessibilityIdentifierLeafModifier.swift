//
//  ViewModifier.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

import Foundation
import SwiftUI

// MARK: The leaf modifier applies the identifier to a View. It prevents further branching creation because growing a branch from a leaf is not feasible. The leaf modifier closes the identifier creation.

public struct AccessibilityIdentifierLeafModifier: ViewModifier {
    @Environment(\.parentAccessibilityBranch) private var branch

    private let leaf: String

    public init(leaf: String) {
        self.leaf = leaf
    }

    public func body(content: Content) -> some View {
        if let branch = branch {
            content
                .accessibilityIdentifier("\(branch).\(leaf)")
                .environment(\.parentAccessibilityBranch, nil)
        } else {
            content
        }
    }
}

public extension View {
    func accessibilityIdentifierLeaf(_ leaf: String) -> ModifiedContent<Self, AccessibilityIdentifierLeafModifier> {
        modifier(AccessibilityIdentifierLeafModifier(leaf: leaf))
    }
}
