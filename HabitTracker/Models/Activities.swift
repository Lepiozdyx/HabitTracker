//
//  Activities.swift
//  HabitTracker
//
//  Created by Alex on 24.11.2023.
//

import Foundation

@Observable
final class Activities {
    var activity: [Activity] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activity) {
                UserDefaults.standard.setValue(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activity = decodedActivities
                return
            }
        }
        
        activity = []
    }
}
