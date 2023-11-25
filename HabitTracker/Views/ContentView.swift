//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alex on 24.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ActivityViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.activities.activity) { activity in
                    NavigationLink(value: activity) {
                        ActivityRowView(activity: activity)
                    }
                }
                .onDelete { offsets in
                    viewModel.removeRows(at: offsets)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    viewModel.isShowingAddActivity = true
                }
            }
            .sheet(isPresented: $viewModel.isShowingAddActivity) {
                AddNewActivityView(viewModel: viewModel)
            }
            .navigationDestination(for: Activity.self) { activity in
                ActivityDetailView(activity: activity)
            }
        }
    }
}

#Preview {
    ContentView()
}
