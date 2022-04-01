//
//  CoreDataManager.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import Foundation
import CoreData

final class CoreDataManager {
    static var shared = CoreDataManager()
    var container: NSPersistentContainer
    private var defaultContainer = "CoreDataContainer"
    
    init() {
        container = NSPersistentContainer(name: defaultContainer)
        loadStores()
    }
    
    private func loadStores() {
        container.loadPersistentStores { description, error in
            if let error = error {
                debugPrint("Error in loading CoreData, \(error)")
            } else {
                debugPrint("CoreData loaded...")
            }
        }
    }
    
    func loadContainer(name container: String?) {
        self.container = NSPersistentContainer(name: container ?? "")
        loadStores()
    }
    
}
