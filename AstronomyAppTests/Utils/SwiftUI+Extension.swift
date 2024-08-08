//
//  SwiftUI+Extension.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

import Foundation
import SwiftUI
extension SwiftUI.View {
    func toVC() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}
