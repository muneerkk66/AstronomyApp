//
//  LazyImageView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import Foundation
import SwiftUI

struct LazyImageView: View {
    let urlString: String?
    @State private var isImageLoaded = false
    var body: some View {
        if let urlString = urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .cornerRadius(25)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .opacity(isImageLoaded ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isImageLoaded = true
                            }
                        }.accessibilityIdentifierLeaf(AppConstants.ViewIdentifier.image)
                default:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .foregroundColor(Color.gray.opacity(0.5))
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isImageLoaded = false
                            }
                        }
                }
            }
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .foregroundColor(Color.gray)
        }
    }
}
