//
//  TodoListView.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-30.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject private var pathMode: PathModel
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    
    
    var body: some View {
        ZStack {
            // MARK: TODO CELL LIST
            VStack{
                if !todoListViewModel.todos.isEmpty {
                    CustomNavigationBar(
                        isDisplayLeftBtn: false,
                        rightBtnAction: {
                            todoListViewModel.navigationRightBtnTapped()
                        },
                        rightBtnType: todoListViewModel.navigationBarRightBtnMode
                    )
                } else {
                    Spacer()
                        .frame(height: 30)
                }
                TitleView()
                AnnouncementView()
            }
        }
    }
    
    
    
}




// MARK: - TODOLIST TITLE VIEW
private struct TitleView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        HStack{
            if todoListViewModel.todos.isEmpty {
                Text("Add todo list \nAdd todo list")
            } else {
                Text("To do list \(todoListViewModel.todos.count) are counted")
            }
            
            Spacer()
        }.font(.system(size: 30, weight: .bold))
            .padding(.leading, 20)
    }
}

// MARK: - TODOLIST 안냬 VIEW
private struct AnnouncementView: View {
    fileprivate var body: some View {
        HStack {
            VStack (spacing: 8){
                Spacer()
                Image(systemName: "pencil")
                Text("#1 todotodotod")
                Text("#2 todotodotod")
                Text("#3 todotodotod")
                Spacer()
            }
            Spacer()
        } .padding(.leading, 20)
    }
}

// MARK: - TODO LIST CONTENTS VIEW
private struct TodoListContentView: View {
    @EnvironmentObject private var  todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        VStack{
            HStack{
                Text("Todo List")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.leading, 20)
                
                Spacer()
            }
            
            ScrollView(.vertical) {
                VStack {
                    Rectangle()
                        .fill(.yellow)
                        .frame(height: 1)
                    
                    ForEach(todoListViewModel.todos, id: \.self) { todo in
                    // TODO: - CAll VIEW BY ADDING TODO CELL VIEW
                    }
                }
            }
        }
    }
}

// MARK: - TODO CELL VIEW
private struct TodoCellView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    @State private var isRemoveSelected: Bool
    private var todo: Todo
    
    fileprivate init(
        isRemoveSelected: Bool = false,
        todo: Todo) {
        self.isRemoveSelected = isRemoveSelected
        self.todo = todo
    }
    
    fileprivate var body: some View {
        VStack(spacing: 20) {
            HStack{
                if !todoListViewModel.isEditTodoMode {
                    Button(
                        action: { todoListViewModel.selectedBoxTapped(todo)},
                        label: { todo.selected ? Image(systemName: "xmark") : Image(systemName: "arrow.right")}
                    )
                }
                
                VStack(alignment: .leading){
                    Text(todo.title)
                    
                    Text(todo.convertedDayAndTime)
                }
                Spacer()
                
                if todoListViewModel.isEditTodoMode {
                    Button(
                    
                    )
                }
            }
        }
    }
    
}

#Preview {
    TodoListView().environmentObject(PathModel()).environmentObject(TodoListViewModel()).background()
}
