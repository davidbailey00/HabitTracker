//
//  HabitView.swift
//  HabitTracker
//
//  Created by David Bailey on 15/06/2021.
//

import SwiftUI

struct HabitView: View {
    @Binding var habit: HabitItem

    var body: some View {
        Form {
            Section(header: Text("Habit details")) {
                VStack(spacing: 0) {
                    if habit.title != "" {
                        Text("Title")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    TextField("Title", text: $habit.title)
                }
                .animation(.default)

                VStack(spacing: 0) {
                    if habit.description != "" {
                        Text("Description")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    TextField("Description", text: $habit.description)
                }
                .animation(.default)
            }

            Section(header: Text("Times completed")) {
                Stepper(
                    "\(habit.times) times",
                    value: $habit.times, in: 0 ... (habit.times + 1)
                )
            }
        }
        .navigationTitle(habit.title == "" ? "Untitled" : habit.title)
    }
}

struct HabitView_Previews: PreviewProvider {
    static let habit = Binding.constant(HabitItem(
        title: "Guitar",
        description: "Playing the guitar",
        times: 3
    ))

    static var previews: some View {
        NavigationView {
            HabitView(habit: habit)
        }
    }
}
