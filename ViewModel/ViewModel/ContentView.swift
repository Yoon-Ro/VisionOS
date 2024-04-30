//
//  ContentView.swift
//  ViewModel
//
//  Created by Yoon Ro on 2024-04-29.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject{
    
   @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 3)
        let fruit2 = FruitModel(name: "Banana", count: 6)
        let fruit3 = FruitModel(name: "Grape", count: 9)
        
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    
    func deleteFruit(indexSet: IndexSet) {
        fruitArray.remove(atOffsets: indexSet)
    }
    
}

struct ContentView: View {
    
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        

        NavigationStack{
            List{
                
                if fruitViewModel.isLoading{
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(.yellow)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .navigationTitle("Fruit List")
            
            
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(
                        destination: RandomScreen(
                        fruitViewModel: FruitViewModel()
                        )) {
                        Image(systemName: "plus")
                    }
                }
            })

        
            .listStyle(DefaultListStyle())
            
//            .onAppear{
//                fruitViewModel.getFruits()
//            }
        }
        
        
    }
    


}


struct RandomScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack{
            
            VStack{
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
                Spacer()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
//    RandomScreen()
    ContentView()
}
