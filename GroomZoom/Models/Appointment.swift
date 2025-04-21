//
//  Appointment.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.
//

import Foundation

// Models/Appointment.swift
struct Appointment: Identifiable {
    let id: UUID
    var selectedService: Service
    var userName: String
    var petName: String
    var petType: String
    var breed: String
    var address: String
    var phone: String
    var date: Date
    var notes: String
}
