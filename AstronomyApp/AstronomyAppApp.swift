//
//  AstronomyAppApp.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import SwiftUI

@main
struct AstronomyAppApp: App {
	private let appFactory = AppFactory()

	var body: some Scene {
		WindowGroup {
			AppCoordinatorView(screenFactory: ScreenFactory(appFactory: appFactory), coordinator: AppCoordinator())
				.onAppear {
					NetworkMonitor.shared.startMonitoring()
				}
		}
	}
}
