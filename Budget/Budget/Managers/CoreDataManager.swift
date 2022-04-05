//
//  CoreDataManager.swift
//  Budget
//
//  Created by 이태현 on 2022/04/05.
//

import CoreData
import Foundation

class CoreDataManager {
    
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "BudgetAppModel")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
        }
    }
}
