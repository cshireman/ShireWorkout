//
//  ContentViewModel.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/9/24.
//

import Foundation
import SwiftUI

@MainActor
class ContentViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    
    private let useCase = GetWorkoutsUseCase()
    
    func load() async {
        let dateRange = DateInterval(start: Date(), end: Date())
        
        do {
            workouts = try await useCase.execute(dateRange: dateRange)
        } catch {
            print(error.localizedDescription)
        }
    }
}
