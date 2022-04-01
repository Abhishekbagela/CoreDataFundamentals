//
//  CoreDataViewModel.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import Foundation
import CoreData


class FruitsViewModel: ObservableObject, BaseFruits {
    @Published var fruitsEntities = Array<FruitsEntity>()
    
    func getFruits() {
        let request = NSFetchRequest<FruitsEntity>(entityName: "FruitsEntity")
        do {
            fruitsEntities = try CoreDataManager.shared.container.viewContext.fetch(request)
        } catch let error {
            debugPrint("error in getting fruit... \(error)")
        }
    }
    
    func addFruit(_ fruit: Fruit) {
        do {
            let newFruit = FruitsEntity(context: CoreDataManager.shared.container.viewContext)
            newFruit.name = fruit.name
            newFruit.price = fruit.price ?? 0
            
            try CoreDataManager.shared.container.viewContext.save()
            getFruits()
        } catch {
            debugPrint("error in adding fruit... \(error)")
        }
    }
    
    func deleteFruit(_ fruit: FruitsEntity) {
        do {
            CoreDataManager.shared.container.viewContext.delete(fruit)
            try CoreDataManager.shared.container.viewContext.save()
            getFruits()
        } catch {
            CoreDataManager.shared.container.viewContext.rollback()
            debugPrint("error in deleting fruit... \(error)")
        }
    }
    
}
