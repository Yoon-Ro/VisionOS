import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "kiwi"
    ]
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fruits, id: \.self) {fruit in
                        Text(fruit)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)

                } header: {
                    HStack{
                        Image(systemName: "flame.fill")
                        Text("Fruits").font(.largeTitle)
                    }.padding().glassBackgroundEffect().frame(depth: 100)
                }

                
                Section {
                    ForEach(veggies, id: \.self) {veggy in
                            Text(veggy)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.blue.opacity(0.9))
                            .padding(.vertical)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.green)

                } header: {
                    Text("Veggies")
                }
            }
//            .listStyle(InsetListStyle())
            .navigationTitle("Grocery List")
            .toolbar{
                ToolbarItem(placement: .bottomOrnament){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    addButton
                }
            }
        }.tint(.red)
    }
    
    var addButton: some View {
        Button("BUTTON"){
            add()
        }
    }
    
    func add(){
        fruits.append("peach")
    }
    
    
    func delete(indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet)

    }
    
    func move(indices: IndexSet, newOffset: Int){
                fruits.move(
                fromOffsets: indices,
                toOffset: newOffset
        )
    }
    
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
