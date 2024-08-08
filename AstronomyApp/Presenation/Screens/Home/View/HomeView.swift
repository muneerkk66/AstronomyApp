//
//  HomeView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        sceneView.onAppear {
            viewModel.handle(.loadPODData)
        }.environmentObject(viewModel)
    }

    @ViewBuilder
    private var sceneView: some View {
        switch viewModel.viewState {
        case .finished:
            APODView()
        case .isLoading, .idle:
            ProgressView()
        case let .error(error):
            ErrorView(errorMessage: error) {
                viewModel.handle(.retryLoadPODData)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator(), fetchPODUseCase: AppFactory().makeFetchPODDataUseCase()))
}
