//
//  ServiceListView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.

/*
 layout plan
 1. title - NavigationTitle - "Hair Cut"
 2. List of Services -
 3. Each Service Cell -
 4. Navigation - NavigationLink
 
 */

import SwiftUI


struct ServiceListView: View {
    @StateObject var viewModel = BookingViewModel()
    
    var body: some View {
        List(viewModel.services) { service in
            NavigationLink(destination: ScheduleView(service: service, viewModel: viewModel)) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(service.name)
                        .font(.headline)
                    Text(service.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(String(format: "$%.2f", service.price))
                            .bold()
                        Spacer()
                        Text("\(service.durationMinutes) mins")
                            .foregroundColor(.gray)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Choose a Service")
    }
}

#Preview {
    ServiceListView()
}
