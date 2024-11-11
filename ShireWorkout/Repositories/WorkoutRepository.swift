//
//  WorkoutRepository.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 11/10/24.
//
import Foundation

protocol WorkoutRepository {
    func fetchWorkouts(dateRange: DateInterval) async throws -> [Workout]
}

class DefaultWorkoutRepository: WorkoutRepository {
    let dataSourceURL = "http://192.168.1.30:5001/workouts"
    
    func fetchWorkouts(dateRange: DateInterval) async throws -> [Workout] {
        let formatter = DateFormatter.sqlDateFormatter
        let start = formatter.string(from: dateRange.start)
        let end = formatter.string(from: dateRange.end)
        
        guard let url = URL(string: dataSourceURL+"?start="+start+"&end="+end) else { throw "Invalid URL" }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        let result = try decoder.decode([Workout].self, from: data)

        return result
    }
}

private struct WorkoutRepositoryKey: InjectionKey {
    static var currentValue: WorkoutRepository = DefaultWorkoutRepository()
}

extension InjectedValues {
    var workoutRepository: WorkoutRepository {
        get { Self[WorkoutRepositoryKey.self] }
        set { Self[WorkoutRepositoryKey.self] = newValue }
    }
}
