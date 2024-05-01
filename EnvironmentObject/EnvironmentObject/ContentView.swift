//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by Yoon Ro on 2024-04-30.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["Kiwi", "Grapes", "Apple", "Banana"])

    }
}

struct ContentView: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: DetailView(selectedItem: item),
                                   label: {
                        Text(item)
                    })
                }
            }
            .navigationTitle("List of Fruits")
        }
        .environmentObject(viewModel)

    }
}

struct DetailView: View {
    
    let selectedItem: String

    
    var body: some View {
        ZStack{
            //background
            Color.orange.ignoresSafeArea()
            
            //foreground
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .padding()
                    .background(.white)
            }


        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                colors:
                    [Color(.red), Color(.blue), Color(.purple)]
                , startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                            Text(item)
                    }
                }
                .foregroundStyle(.white)
                    .font(.extraLargeTitle)
            }
            
        }
    }
}


#Preview(windowStyle: .automatic) {
//    DetailView(selectedItem: "Example")
    ContentView()
}
