//
//  ContentView.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 30/03/22.
//

import SwiftUI


struct FruitsHomeView: View {
    //ViewModel
    @StateObject var vm = FruitsViewModel()
    
    //Input Fields
    @State private var name = ""
    @State private var price = ""
    
    //Flag
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Fruit")
                    TextField("Name", text: $name)
                    Text("Rs.")
                    TextField("Price", text: $price)
                    Button {
                        if ((!name.isEmpty) && (!price.isEmpty)) {
                            vm.addFruit(Fruit(name, Int64(price) ?? 0))
                            self.name = ""
                            self.price = ""
                        } else {
                            self.showAlert = true
                        }
                    } label: {
                        Text("Add")
                            .frame(width: 50, height: 20)
                            .foregroundColor(Color.white)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    } // Button
                } // HStack
                .padding(.horizontal)
                
                List {
                    if (vm.fruitsEntities.isEmpty) {
                        Text("No fruits 😡")
                    } else {
                        ForEach(vm.fruitsEntities) { fruit in
                            Text((fruit.name ?? "") + ", Rs.\(fruit.price)")
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let fruit = vm.fruitsEntities[index]
                                vm.deleteFruit(fruit)
                            }
                        } // onDelete
                    } // else
                } // List
            } // VStack
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Enter fruit name & price before adding"))
            })
            .navigationTitle("Fruits")
            .onAppear {
                vm.getFruits()
            }
        } // NavigationView
    } // body
} // FruitsHomeView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsHomeView()
    }
}
