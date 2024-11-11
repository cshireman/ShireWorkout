//
//  Workout.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/8/24.
//

import Foundation

struct Workout: Codable, Identifiable {
    let id: UInt32
    let name: String
    let date: Date
    let sections: [Section]
}
