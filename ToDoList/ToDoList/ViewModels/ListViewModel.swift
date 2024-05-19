//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Yoon Ro on 2024-05-16.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 CREATE
 READ
 UPDATE
 DELETE
 */



class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItem
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            items[index] = item.updateCompletion()
        }
    }
    
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
}
