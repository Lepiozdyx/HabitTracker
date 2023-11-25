//
//  ActivityRowView.swift
//  HabitTracker
//
//  Created by Alex on 24.11.2023.
//

import SwiftUI

struct ActivityRowView: View {
    let activity: Activity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(activity.priority)")
                        .padding(.bottom, 5)
                    
                    Text(activity.name)
                        .font(.title3)
                        .padding(.bottom, 5)
                }
                    
                Text(activity.type)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text("\(activity.counter)")
        }
    }
}

#Preview {
    ActivityRowView(activity: Activity(type: "Learning", priority: "🔵", name: "English", description: "New English course", counter: 7))
}
