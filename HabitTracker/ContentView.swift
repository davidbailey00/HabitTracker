//
//  ContentView.swift
//  HabitTracker
//
//  Created by David Bailey on 15/06/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var habits = Habits()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Guitar")
                        .font(.headline)
                    Text("Playing the guitar")
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Habit Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
