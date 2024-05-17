//
// ListView.swift
// ToDoList
//
// Created by Yoon Ro on 2024-05-15.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel


    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.spring) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                EditButton()
            }

            ToolbarItem(placement: .bottomBar) { // Changed placement for better visibility
                HStack {
                    NavigationLink("Add", destination: AddView(textFieldText: "", alertTitle: ""))
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
    }.environmentObject(ListViewModel())
}
