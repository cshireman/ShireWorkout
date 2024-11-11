//
//  ContentView.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        List(viewModel.workouts) { workout in
            Text("name: \(workout.name)")
        }
        .padding()
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    ContentView()
}
