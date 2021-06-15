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
                ForEach(habits.items) { item in
                    NavigationLink(destination: Text("TODO")) {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete { offsets in
                    habits.items.remove(atOffsets: offsets)
                }
                .onMove { source, dest in
                    habits.items.move(fromOffsets: source, toOffset: dest)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // @TODO
                    }) {
                        Text("New habit")
                        Image(systemName: "hourglass.badge.plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
