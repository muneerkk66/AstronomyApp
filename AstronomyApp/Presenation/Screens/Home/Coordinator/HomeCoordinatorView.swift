//
//  HomeCoordinatorView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import SwiftUI

struct HomeCoordinatorView: View {
    @ObservedObject private var coordinator: HomeCoordinator
    private let factory: ScreenFactory

    init(_ coordinator: HomeCoordinator, factory: ScreenFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeHomeView(coordinator: coordinator)
                .navigationDestination(for: HomeCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: HomeCoordinator.Screen) -> some View {
        switch screen {
        case .details:
            EmptyView()
        }
    }
}
