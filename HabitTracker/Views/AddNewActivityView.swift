//
//  AddNewActivityView.swift
//  HabitTracker
//
//  Created by Alex on 24.11.2023.
//

import SwiftUI

struct AddNewActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var viewModel: ActivityViewModel
    
    let activityTypes = ["Sports", "Nutrition", "Study", "Work", "Sleep", "Meditation", "Reading", "Hobbies", "Socializing", "Travel", "Cleaning", "Shopping", "Family Time", "Relaxation", "Planning", "Volunteering"]
    let priorityTypes = ["🔴", "🟡", "🔵"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter your activity name..", text: $viewModel.name)
                    
                    Picker("Type", selection: $viewModel.type) {
                        ForEach(activityTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Priority", selection: $viewModel.priority) {
                        ForEach(priorityTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Indicate the type of activity")
                } footer: {
                    Text("Indicate the type of activity")
                }                            
                
                Section("A short description of your activity") {
                    TextField("Enter your activity description..", text: $viewModel.description)
                }
            }
            .navigationTitle("Describe your activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark", role: .cancel, action: { dismiss() })
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "checkmark") {
                        viewModel.saveNewActivity()
                        dismiss()
                    }
                    .disabled(viewModel.isDisabled())
                }
            }
        }
    }
}

#Preview {
    AddNewActivityView(viewModel: ActivityViewModel())
}
