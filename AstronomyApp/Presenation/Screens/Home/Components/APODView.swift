//
//  APODView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import SwiftUI

struct APODView: View {
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                List {
                    LazyImageView(urlString: viewModel.podData?.url)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                        .overlay(footer, alignment: .bottom)
                        .cornerRadius(10)
                    description
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    @ViewBuilder
    var footer: some View {
        VStack {
            Text((viewModel.podData?.title).orEmpty)
                .font(.caption)
                .fontWeight(.bold)
                .minimumScaleFactor(0.2)
                .foregroundColor(.white)
            Text((viewModel.podData?.date).orEmpty)
                .font(.footnote)
                .foregroundColor(.white)
        }.padding()
    }

    @ViewBuilder
    var description: some View {
        Text((viewModel.podData?.description).orEmpty)
            .font(.caption)
            .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        APODView()
    }
}
