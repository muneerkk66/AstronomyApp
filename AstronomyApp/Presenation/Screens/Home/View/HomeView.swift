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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
	HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator(), fetchPODUseCase: AppFactory().makeFetchPODDataUseCase()))
}
