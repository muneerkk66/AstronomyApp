//
//  HomeCoordinator.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation
import SwiftUI

final class AppCoordinator: ObservableObject {
    enum State {
        case idle
        case main
    }

    enum Action {
        case showMain
    }

    init() { state = .idle }

    @Published private(set) var state: State

    func handle(_ action: Action) {
        switch action {
        case .showMain:
            state = .main
        }
    }
}
