//
//  AddView.swift
//  ToDoList
//
//  Created by Yoon Ro on 2024-05-15.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @FocusState private var textFieldTextFocus: Bool
    @State var alertTitle: String
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .focused($textFieldTextFocus)
                    .padding()
                    .glassBackgroundEffect()
                .foregroundStyle(.white)
                
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                })
                .padding(.top, 40)
            }
            .padding(16)
        }
        .navigationTitle("Add an Item")

        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
        
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.textFieldTextFocus = true
                }
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationStack{
        AddView(textFieldText: "Type something here", alertTitle: "")
    }.environmentObject(ListViewModel())
}
