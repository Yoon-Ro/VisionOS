//
// ListView.swift
// ToDoList
//
// Created by Yoon Ro on 2024-05-15.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second title", isCompleted: true),
        ItemModel(title: "This is the third title", isCompleted: false)
    ]

    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }

            ToolbarItem(placement: .bottomBar) { // Changed placement for better visibility
                HStack {
                    NavigationLink("Add", destination: AddView(textFieldText: ""))
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
