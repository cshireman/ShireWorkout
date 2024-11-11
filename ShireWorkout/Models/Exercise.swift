//
//  Exercise.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/8/24.
//

import Foundation

struct Exercise: Codable {
    let name: String
    let minReps: UInt?
    let maxReps: UInt?
    let duration: TimeInterval?
    let weight: UInt?
}
