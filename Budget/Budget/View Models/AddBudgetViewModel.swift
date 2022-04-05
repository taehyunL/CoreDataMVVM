//
//  AddBudgetViewModel.swift
//  Budget
//
//  Created by 이태현 on 2022/04/06.
//

import Foundation
import CoreData

class AddBudgetViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var total: String = ""
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let budget = Budget(context: context)
            budget.title = name
            budget.total = Double(total) ?? 0
            try budget.save()
        } catch {
            print(error)
        }
    }
}
