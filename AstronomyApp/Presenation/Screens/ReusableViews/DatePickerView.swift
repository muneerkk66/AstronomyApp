//
//  DatePickerView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import SwiftUI
struct DatePickerView: View {
    @Binding var selectedDate: Date
    let onSelectDate: () -> Void
    var body: some View {
        VStack {
            DatePicker("",
                       selection: $selectedDate,
                       in: ...Date(),
                       displayedComponents: [.date]
            )
            .labelsHidden()
            .datePickerStyle(.wheel)
            .padding()
            Button("Done") {
                selectedDate = selectedDate
                onSelectDate()
            }
            .padding()
        }.presentationDetents([.medium, .large]).accessibilityIdentifier(AppConstants.ViewIdentifier.datePicker)
    }
}
