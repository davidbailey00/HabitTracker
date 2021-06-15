//
//  HabitView.swift
//  HabitTracker
//
//  Created by David Bailey on 15/06/2021.
//

import SwiftUI

struct HabitView: View {
    @State private var title: String
    @State private var description: String

    var body: some View {
        Form {
            VStack(spacing: 0) {
                if title != "" {
                    Text("Title")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                TextField("Title", text: $title)
            }
            .animation(.default)

            VStack(spacing: 0) {
                if description != "" {
                    Text("Description")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                TextField("Description", text: $description)
            }
            .animation(.default)
        }
        .navigationTitle(title == "" ? "Untitled" : title)
    }

    init(habit: HabitItem) {
        title = habit.title
        description = habit.description
    }
}

struct HabitView_Previews: PreviewProvider {
    static let habit = HabitItem(
        title: "Guitar",
        description: "Playing the guitar",
        times: 3
    )

    static var previews: some View {
        NavigationView {
            HabitView(habit: habit)
        }
    }
}
