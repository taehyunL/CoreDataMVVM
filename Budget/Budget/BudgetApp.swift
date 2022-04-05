//
//  BudgetApp.swift
//  Budget
//
//  Created by 이태현 on 2022/04/05.
//

import SwiftUI

@main
struct BudgetApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ContentView(vm: BudgetListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
