//
//  ContentView.swift
//  GroomZoom
//
//  Created by Damian Jardim on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BookingViewModel()

    var body: some View {
        VStack {
            HomeView(viewModel: viewModel)
//                .environmentObject(viewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
