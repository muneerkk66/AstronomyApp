//
//  ParentAccessibility.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

import SwiftUI

struct ParentAccessibilityBranchKey: EnvironmentKey {
    static let defaultValue: String? = nil
}

extension EnvironmentValues {
    var parentAccessibilityBranch: String? {
        get { self[ParentAccessibilityBranchKey.self] }
        set { self[ParentAccessibilityBranchKey.self] = newValue }
    }
}
