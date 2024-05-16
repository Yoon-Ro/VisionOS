//
//  ItemModel.swift
//  ToDoList
//
//  Created by Yoon Ro on 2024-05-15.
//

import Foundation


struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
