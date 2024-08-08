//
//  HomeViewModel.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinatorProtocol
    private let fetchPODUseCase: FetchPODUseCase

    @Published var podData: PODData?
    @Published var viewState: HomeViewState = .idle
    @Published var selectedDate: Date = Date()

    private var disposables = Set<AnyCancellable>()

    init(coordinator: HomeCoordinatorProtocol, fetchPODUseCase: FetchPODUseCase) {
        self.coordinator = coordinator
        self.fetchPODUseCase = fetchPODUseCase
    }

    func handle(_ event: HomeViewEvent) {
        switch event {
        case .loadPODData, .retryLoadPODData:
            fetchPodData(date: selectedDate)
        case .idle:
			break;
        }
    }

    func fetchPodData(date: Date) {
        viewState = .isLoading
        fetchPODUseCase
            .execute(date: date)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case let .failure(error):
                    viewState = .error(error.localizedDescription)
                    break
                case .finished:
                    viewState = .finished
                    break
                }
            }, receiveValue: { [weak self] results in
                guard let self = self else { return }
                podData = results
            })
            .store(in: &disposables)
    }
}
