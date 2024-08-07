//
//  ScreenFactory.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

final class ScreenFactory: HomeCoordinatorFactory {
    private let appFactory: AppFactory

    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
}

// MARK: - HomeViewFactory

extension ScreenFactory: HomeViewFactory {
    func makeHomeView(coordinator: HomeCoordinatorProtocol) -> HomeView {
        let viewModel = HomeViewModel(
            coordinator: coordinator,
            fetchPODUseCase: appFactory.makeFetchPODDataUseCase())
        let view = HomeView(viewModel: viewModel)
        return view
    }
}
