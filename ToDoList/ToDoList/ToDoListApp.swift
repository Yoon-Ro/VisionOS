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
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
        }
    }
}
