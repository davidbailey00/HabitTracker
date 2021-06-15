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
}

class Habits: ObservableObject {
    @Published var items = [HabitItem]()
}
