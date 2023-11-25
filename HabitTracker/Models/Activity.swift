//
//  Activity.swift
//  HabitTracker
//
//  Created by Alex on 24.11.2023.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let type: String
    let priority: String
    let name: String
    let description: String
    var counter: Int
}
