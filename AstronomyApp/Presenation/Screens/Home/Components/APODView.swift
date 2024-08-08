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
                        LazyImageView(urlString: viewModel.podData?.url)
                            .frame(width: geometry.size.width)
                            .overlay(footer, alignment: .bottom)
                        description
                    }
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
    var footer: some View {
        VStack(alignment: .center) {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        APODView()
    }
}
