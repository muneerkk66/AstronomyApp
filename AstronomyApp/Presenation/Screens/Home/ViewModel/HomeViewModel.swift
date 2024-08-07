//
//  HomeViewModel.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
	private let coordinator: HomeCoordinatorProtocol
	private let fetchPODUseCase: FetchPODUseCase

	init(coordinator: HomeCoordinatorProtocol, fetchPODUseCase: FetchPODUseCase) {
		self.coordinator = coordinator
		self.fetchPODUseCase = fetchPODUseCase
	}
}
