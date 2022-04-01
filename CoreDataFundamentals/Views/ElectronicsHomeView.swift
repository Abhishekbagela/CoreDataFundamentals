//
//  ElectronicsHomeView.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import SwiftUI


struct ElectronicsHomeView: View {
    //ViewModel
    @StateObject var vm = ElectronicsViewModel()
    
    //Input Fields
    @State private var name = ""
    @State private var price = ""
    
    //Flag
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Product")
                    TextField("Name", text: $name)
                    Text("Rs.")
                    TextField("Price", text: $price)
                    Button {
                        if ((!name.isEmpty) && (!price.isEmpty)) {
                            vm.addProduct(Product(name, Int64(price) ?? 0))
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
                    if (vm.productEntities.isEmpty) {
                        Text("No products 😡")
                    } else {
                        ForEach(vm.productEntities) { product in
                            Text((product.name ?? "") + ", Rs.\(product.price)")
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let product = vm.productEntities[index]
                                vm.deleteProduct(product)
                            }
                        } // onDelete
                    } // else
                } // List
            } // VStack
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Enter item name & price before adding"))
            })
            .navigationTitle("Electronics")
            .onAppear {
                vm.getProducts()
            }
        } // NavigationView
    } // body
} // ElectronicsHomeView

struct ElectronicsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ElectronicsHomeView()
    }
}
