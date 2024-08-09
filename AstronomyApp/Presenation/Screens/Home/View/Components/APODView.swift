//
//  APODView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import SwiftUI

struct APODView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showDatePicker = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    List {
                        mediaView(geometry: geometry).shadow(radius: 4, x: 0, y: 4)
                        footer
                    }.listStyle(PlainListStyle())
                    dateView
                }
            }.sheet(isPresented: $showDatePicker) {
                DatePickerView(selectedDate: $viewModel.selectedDate, onSelectDate: {
                    viewModel.handle(.loadPODData)
                })
            }
        }
    }

    @ViewBuilder
    func mediaView(geometry: GeometryProxy) -> some View {
        let url = (viewModel.podData?.url).orEmpty
        switch viewModel.podData?.type {
        case .image:
            LazyImageView(urlString: url)
				.frame(minHeight: geometry.size.height * 0.3)
        case .video:
            WebContentView(url: url)
                .frame(width: geometry.size.width, height: geometry.size.height * 0.60)
        case nil:
            EmptyView()
        }
    }

    @ViewBuilder
    var footer: some View {
        VStack(alignment: .leading) {
            Text((viewModel.podData?.title).orEmpty)
                .font(.subheadline)
                .fontWeight(.bold)
                .minimumScaleFactor(0.2)
                .foregroundColor(.primary)
				.accessibilityIdentifierLeaf(AppConstants.ViewIdentifier.title)
			Text((viewModel.podData?.date.displayDate).orEmpty)
                .font(.footnote)
				.fontWeight(.medium)
                .foregroundColor(.primary)
				.padding(.bottom,10)
				.accessibilityIdentifierLeaf(AppConstants.ViewIdentifier.date)
            Text((viewModel.podData?.description).orEmpty)
                .font(.caption)
				.foregroundColor(.primary)
				.accessibilityIdentifierLeaf(AppConstants.ViewIdentifier.description)
        }.padding()
    }

    @ViewBuilder
    var dateView: some View {
        Button {
            showDatePicker = true
        } label: {
            Image(systemName: "calendar")
                .font(.title.weight(.semibold))
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4)
        }
        .padding()
		.accessibilityIdentifierLeaf("calendar")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        APODView()
    }
}
