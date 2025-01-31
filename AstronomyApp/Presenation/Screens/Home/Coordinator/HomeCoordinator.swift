//
//  HomeCoordinator.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

final class HomeCoordinator: Coordinator {
    enum Screen: Routable {
        case details
    }

    @Published var navigationPath = [Screen]()
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showDetails() {
        navigationPath.append(.details)
    }
}
