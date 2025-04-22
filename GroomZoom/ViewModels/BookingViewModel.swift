//
//  BookingViewModel.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/20/25.
//

import Foundation

class BookingViewModel: ObservableObject {
    @Published var services: [Service] = []
    @Published var selectedService: Service?
    
    @Published var appointmentDate = Date()
    @Published var userName = ""
    @Published var petName = ""
    @Published var petType = ""
    @Published var breed = ""
    @Published var address = ""
    @Published var phone = ""
    @Published var notes = ""
    
    // In BookingViewModel.swift
    @Published var selectedDate: Date?
    @Published var selectedTime: String?
    @Published var userPhone: String = ""
    @Published var userAddress: String = ""
    @Published var userNotes: String = ""
    
    @Published var bookings: [Booking] = [] {
        didSet{
            saveBookings()
        }
    }
    
    func confirmAndSaveBooking(){
        let booking = Booking(
            id: UUID(),
            serviceName: selectedService?.name ?? "",
            date: selectedDate ?? Date(),
            time: selectedTime ?? "",
            userName: userName,
            userPhone: userPhone,
            userAddress: userAddress,
            userNotes: userNotes
        )
        bookings.append(booking)
    }
    
    func cancelBooking(_ booking: Booking){
        bookings.removeAll(){
            $0.id == booking.id
        }
    }
    
    private func saveBookings(){
        if let encoded = try? JSONEncoder().encode(bookings){
            UserDefaults.standard.set(encoded, forKey: "bookings")
        }
    }
    
    private func loadBookings(){
        if let data = UserDefaults.standard.data(forKey: "bookings"),
           let decoded = try? JSONDecoder().decode([Booking].self, from:data){
            bookings = decoded
        }
    }
    
    
    func submitAppointment() {
        // Save or send to backend
        print("Submitted appointment for \(userName) and \(petName)")
    }
    
    init() {
        services = [
            Service(id: UUID(), name: "Full Groom", description: "Bath, haircut, nails, ears", price: 65, durationMinutes: 60),
            Service(id: UUID(), name: "Nail Trim", description: "Quick nail trim", price: 20, durationMinutes: 15),
        ]
    }
}
