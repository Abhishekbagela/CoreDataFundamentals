//
//  ElectronicsViewModel.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import Foundation
import CoreData


class ElectronicsViewModel: ObservableObject, BaseElectronics {
    @Published var productEntities = Array<ProductEntity>()
    
    func getProducts() {
        let request = NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
        do {
            productEntities = try CoreDataManager.shared.container.viewContext.fetch(request)
        } catch let error {
            debugPrint("error in getting fruit... \(error)")
        }
    }
    
    func addProduct(_ product: Product) {
        do {
            let newProduct = ProductEntity(context: CoreDataManager.shared.container.viewContext)
            newProduct.name = product.name
            newProduct.price = product.price ?? 0
            
            try CoreDataManager.shared.container.viewContext.save()
            getProducts()
        } catch {
            debugPrint("error in adding fruit... \(error)")
        }
    }
    
    func deleteProduct(_ product: ProductEntity) {
        do {
            CoreDataManager.shared.container.viewContext.delete(product)
            try CoreDataManager.shared.container.viewContext.save()
            getProducts()
        } catch {
            CoreDataManager.shared.container.viewContext.rollback()
            debugPrint("error in deleting fruit... \(error)")
        }
    }
    
}
