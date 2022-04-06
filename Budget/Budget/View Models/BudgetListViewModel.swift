//
//  BudgetListViewModel.swift
//  Budget
//
//  Created by 이태현 on 2022/04/06.
//

import Foundation
import CoreData

@MainActor//main queue 에서 실행되어야함 add 나 delete가 되었을때의 변화를 view에 즉시 반영해줘야 하기 때문
class BudgetListViewModel: NSObject, ObservableObject {

    @Published var budgets = [BudgetViewModel]()
    private let fetchedResultsController: NSFetchedResultsController<Budget>
    private (set) var context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context

        fetchedResultsController = NSFetchedResultsController(fetchRequest: Budget.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let budgets = fetchedResultsController.fetchedObjects else {
                return
            }
            
            self.budgets = budgets.map(BudgetViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
    func deleteBudget(budgetId: NSManagedObjectID) {
        do {
            guard let budget = try context.existingObject(with: budgetId) as? Budget else {
                return
            }
            try budget.delete()
        } catch {
            print(error)
        }
    }//ondelete활용 방식
    
    func deleteBudget(budget: BudgetViewModel) {
        do {
            guard let budget = try context.existingObject(with: budget.id) as? Budget else {
                return
            }
            try budget.delete()
        } catch {
            print(error)
        }
    }//목록에 있는 budget 그 자체 삭제하기
}

extension BudgetListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let budgets = controller.fetchedObjects as? [Budget] else {
            return
        }
        
        self.budgets = budgets.map(BudgetViewModel.init)
    }
}

struct BudgetViewModel: Identifiable {
    private var budget: Budget
    
    init(budget: Budget) {
        self.budget = budget
    }
    
    var id: NSManagedObjectID {
        budget.objectID
    }
    
    var title: String {
        budget.title ?? ""
    }
    
    var total: Double {
        budget.total
    }
    
}
