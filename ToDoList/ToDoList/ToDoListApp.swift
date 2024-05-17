//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Yoon Ro on 2024-05-15.
//

import SwiftUI


/*
  MVVM Architecutre
 
    Model - data point
    View - UI
    ViewModel - manages Models for View
 
 */


@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
