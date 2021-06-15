//
//  Habits.swift
//  HabitTracker
//
//  Created by David Bailey on 15/06/2021.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    let times: Int
}

class Habits: ObservableObject {
    @Published var items = [
        HabitItem(title: "Guitar", description: "Playing the guitar", times: 0),
        HabitItem(title: "Kotlin", description: "Writing Kotlin code", times: 0)
    ]
}
