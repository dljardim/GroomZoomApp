//
//  BookingHistoryView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/21/25.
//

import SwiftUI

struct BookingHistoryView: View {
    @ObservedObject var viewModel: BookingViewModel
    
    var body: some View {
        List {
            if !upcomingBookings.isEmpty {
                Section(header: Text("Upcoming")) {
                    ForEach(upcomingBookings) { booking in
                        bookingCard(for: booking, canCancel: true)
                    }
                }
            }
            
            if !pastBookings.isEmpty {
                Section(header: Text("Past")) {
                    ForEach(pastBookings) { booking in
                        bookingCard(for: booking, canCancel: false)
                    }
                }
            }
        }
        .navigationTitle("My Appointments")
    }
    
    private var upcomingBookings: [Booking] {
        viewModel.bookings.filter { $0.date >= Calendar.current.startOfDay(for: Date()) }
            .sorted { $0.date < $1.date }
    }
    
    private var pastBookings: [Booking] {
        viewModel.bookings.filter { $0.date < Calendar.current.startOfDay(for: Date()) }
            .sorted { $0.date > $1.date }
    }
    
    private func bookingCard(for booking: Booking, canCancel: Bool) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(booking.serviceName).font(.headline)
            Text("📅 \(booking.date.formatted(date: .abbreviated, time: .omitted))")
            Text("⏰ \(booking.time)")
            Text("🏠 \(booking.userAddress)")
            
            if !booking.userNotes.isEmpty {
                Text("📝 Notes: \(booking.userNotes)")
            }
            
            if canCancel {
                Button("Cancel Appointment", role: .destructive) {
                    viewModel.cancelBooking(booking)
                }
                .font(.caption)
                .padding(.top, 4)
            }
        }
        .padding(.vertical, 8)
    }
}
