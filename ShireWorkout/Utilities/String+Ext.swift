//
//  String+Ext.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/8/24.
//

import Foundation

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
