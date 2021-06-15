//
//  Habits.swift
//  HabitTracker
//
//  Created by David Bailey on 15/06/2021.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    let times: Int

    var formattedTimes: String {
        "\(times) time\(times == 1 ? "" : "s")"
    }
}

class Habits: ObservableObject {
    @Published var items = [
        HabitItem(title: "Guitar", description: "Playing the guitar", times: 0),
        HabitItem(title: "Kotlin", description: "Writing Kotlin code", times: 1),
        HabitItem(title: "Reading", description: "Reading Macbeth", times: 3)
    ]
}
