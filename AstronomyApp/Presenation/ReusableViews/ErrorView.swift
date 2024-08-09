//
//  ErrorView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let retryAction: () -> Void

    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: retryAction) {
                Text("action.retry")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ErrorView(errorMessage: "") {}
}
