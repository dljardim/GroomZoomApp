//
//  Service.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.
//

import Foundation

// Models/Service.swift
struct Service: Identifiable{
    let id: UUID
    let name: String
    let description: String
    let price: Double
    let durationMinutes: Int
}
