//
//  Section.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/8/24.
//

import Foundation

struct Section: Codable, Identifiable {
    let id: UInt
    let name: String
    let rounds: UInt
    let exercises: [Exercise]
}
