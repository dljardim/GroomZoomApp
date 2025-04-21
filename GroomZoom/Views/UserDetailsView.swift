//
//  UserDetailsView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/21/25.
//

import SwiftUI

struct UserDetailsView: View {
    let service: Service
    let date: Date
    let time: String
    @ObservedObject var viewModel: BookingViewModel
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var notes: String = ""
    
    @State private var bookingConfirmed = false
    
    @State private var navigateToConfirmation = false

    
    var body: some View {
        Form {
            Section(header: Text("Your Info")) {
                TextField("Name", text: $name)
                TextField("Phone", text: $phone)
                    .keyboardType(.phonePad)
            }
            
            Section(header: Text("Address")) {
                TextField("Street Address", text: $address)
            }
            
            Section(header: Text("Special Instructions")) {
                TextField("e.g., gate code, pet notes", text: $notes)
            }
            
            Section {
                Button(action: {
                    confirmBooking()
                    navigateToConfirmation = true
                }) {
                    Text("Confirm Appointment")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor((formIsValid() ? .accentColor : .gray))
                }
                .disabled(!formIsValid())
                
                // Hidden navigation link
                NavigationLink(
                    destination: ConfirmationView(viewModel: viewModel),
                    isActive: $navigateToConfirmation
                ) {
                    EmptyView()
                }
            }
        }
        .navigationTitle("Your Details")
        .alert("Booking Confirmed!", isPresented: $bookingConfirmed) {
            Button("OK") { }
        } message: {
            Text("Your grooming appointment is scheduled for \(date.formatted(date: .abbreviated, time: .omitted)) at \(time).")
        }
    }
    
    func formIsValid() -> Bool {
        !name.isEmpty && !phone.isEmpty && !address.isEmpty
    }
    
    func confirmBooking() {
        viewModel.selectedService = service
        viewModel.selectedDate = date
        viewModel.selectedTime = time
        viewModel.userName = name
        viewModel.userPhone = phone
        viewModel.userAddress = address
        viewModel.userNotes = notes
        
        bookingConfirmed = true
    }
}
