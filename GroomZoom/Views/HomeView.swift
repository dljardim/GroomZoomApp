//
//  HomeView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.
//

/*
 
 logo or image -> Image - branding and visual appeal
 welsome text -> Text - Brief intro or tagline
 cta button > navigationLink or button - Starts the booking flow
 
 
 */

// Views/HomeView.swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                // Logo or image
                Image("groomingLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                
                // Welcome text
                Text("Welcome to Fresh Fur Mobile Grooming!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // CTA Button
                NavigationLink(destination: ServiceListView()) {
                    Text("Book an Appointment")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
            .navigationTitle("Groom Zoom")
        }
    }
}

#Preview {
    HomeView()
}
