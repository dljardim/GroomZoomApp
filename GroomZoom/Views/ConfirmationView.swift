//
//  ConfirmationView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.
//

import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var viewModel: BookingViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Appointment Confirmed!")
                .font(.title)
                .fontWeight(.semibold)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("🐶 **Service**: \(viewModel.selectedService?.name ?? "")")
                Text("📅 **Date**: \(formattedDate(viewModel.selectedDate))")
                Text("⏰ **Time**: \(viewModel.selectedTime ?? "")")
                Divider()
                Text("👤 **Name**: \(viewModel.userName)")
                Text("📞 **Phone**: \(viewModel.userPhone)")
                Text("🏠 **Address**: \(viewModel.userAddress)")
                if !viewModel.userNotes.isEmpty {
                    Text("📝 **Notes**: \(viewModel.userNotes)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            
            Spacer()
            
            NavigationLink(destination: HomeView(viewModel:viewModel)) {
                Text("Back to Home")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        return date.formatted(date: .abbreviated, time: .omitted)
    }
}
