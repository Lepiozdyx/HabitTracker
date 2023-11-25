//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Alex on 25.11.2023.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(activity.description)
                    .padding(.bottom, 8)
                
                HStack {
                    Text(activity.type)
                        .font(.subheadline)
                    
                    Text(activity.priority)
                }
            }
            .padding()
        }
        .navigationTitle(activity.name)
    }
}

#Preview {
    ActivityDetailView(activity: Activity(type: "Sport", priority: "🔴", name: "Yoga", description: "Tapping one of the activities should show a detail screen with the description.", counter: 7))
}
