//
//  ScheduleView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.
//

import SwiftUI


struct ScheduleView: View {
    let service: Service
    @ObservedObject var viewModel: BookingViewModel
    
    @State private var selectedDate = Date()
    @State private var selectedTime: String? = nil
    
    // Sample time slots (in real app these might come from an API)
    let availableTimeSlots = [
        "9:00 AM", "10:30 AM", "12:00 PM", "1:30 PM", "3:00 PM", "4:30 PM"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Selected Service: \(service.name)")
                .font(.title2)
                .bold()
            
            Text("Price: $\(String(format: "%.2f", service.price))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Date picker
            VStack(alignment: .leading) {
                Text("Choose a Date")
                    .font(.headline)
                
                DatePicker("",
                           selection: $selectedDate,
                           in: Date()..., // only future dates
                           displayedComponents: [.date])
                .datePickerStyle(.graphical)
            }
            
            // Time slot picker
            VStack(alignment: .leading) {
                Text("Choose a Time")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(availableTimeSlots, id: \.self) { time in
                            Button(action: {
                                selectedTime = time
                            }) {
                                Text(time)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 16)
                                    .background(selectedTime == time ? Color.accentColor : Color.gray.opacity(0.2))
                                    .foregroundColor(selectedTime == time ? .white : .primary)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            // Continue button
            if selectedTime != nil {
                NavigationLink(destination: UserDetailsView(service: service, date: selectedDate, time: selectedTime!, viewModel: viewModel)) {
                    Text("Continue")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            } else {
                Text("Please select a time to continue")
                    .foregroundColor(.gray)
                    .padding(.top)
            }
            
        }
        .padding()
        .navigationTitle("Schedule Visit")
    }
}

#Preview {
    var service = Service(
        id: UUID(),
        name: "String-name",
        description: "String-description",
        price: 19.99,
        durationMinutes: 30
    )
    
    var viewModel:BookingViewModel = BookingViewModel()
    ScheduleView(service: service, viewModel: viewModel)
}
