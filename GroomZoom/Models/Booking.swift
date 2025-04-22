//
//  Booking.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/21/25.
//

import Foundation

struct Booking: Identifiable, Codable {
    let id: UUID
    let serviceName: String
    let date: Date
    let time: String
    let userName:String
    let userPhone:String
    let userAddress:String
    let userNotes:String
}
