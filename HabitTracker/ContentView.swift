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
                ForEach(
                    Array(zip(habits.items.indices, habits.items)),
                    id: \.1.id
                ) { index, item in
                    NavigationLink(
                        destination: HabitView(habit: $habits.items[index])
                    ) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.description)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Text(item.formattedTimes)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 6)
                                .background(
                                    item.times < 1 ? Color.purple : Color.green
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 6))
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
                        Image(systemName: "plus")
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
