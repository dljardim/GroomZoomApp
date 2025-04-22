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
    
    @ObservedObject var viewModel: BookingViewModel
    
    @State private var imageFromWeb:Image? = nil

    func loadImageFromWeb() async {
        let url = URL(string: "https://via.placeholder.com/150")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let uiImage = UIImage(data: data) {
                let swiftUIImage = Image(uiImage: uiImage)
                imageFromWeb = swiftUIImage
            }
        } catch {
            print("❌ Failed to load image: \(error)")
        }
    }
    
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
                
                NavigationLink(destination: BookingHistoryView(viewModel: viewModel)) {
                    Text("View My Appointments")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
                
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
    HomeView(viewModel: BookingViewModel())
}
