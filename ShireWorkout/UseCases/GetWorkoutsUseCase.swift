//
//  GetWorkoutsUseCase.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 11/10/24.
//

import Foundation

class GetWorkoutsUseCase {
    @Injected(\.workoutRepository) var workoutRepository: WorkoutRepository
    
    func execute(dateRange: DateInterval) async throws -> [Workout]{
        return try await workoutRepository.fetchWorkouts(dateRange: dateRange)
    }
}
