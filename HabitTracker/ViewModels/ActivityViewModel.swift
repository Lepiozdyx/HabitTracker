//
//  ActivityViewModel.swift
//  HabitTracker
//
//  Created by Alex on 24.11.2023.
//

import Foundation
import Observation

@Observable
final class ActivityViewModel {
    let activities = Activities()
    var isShowingAddActivity = false
    var type = ""
    var priority = "🟡"
    var name = ""
    var description = ""
    var counter = 0
    
    func removeRows(at offsets: IndexSet) {
        activities.activity.remove(atOffsets: offsets)
    }
    
    func saveNewActivity() {
        let newActivity = Activity(type: type, priority: priority, name: name, description: description, counter: counter)
        activities.activity.append(newActivity)
        
        // reset the current property values
        name = ""
        priority = "🟡"
        counter = 0
        description = ""
    }
    
    func isDisabled() -> Bool {
        name.isEmpty
    }
}
