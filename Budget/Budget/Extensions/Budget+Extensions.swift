//
//  Budget+Extensions.swift
//  Budget
//
//  Created by 이태현 on 2022/04/06.
//

import CoreData
import Foundation

extension Budget: BaseModel {
    
    static var all: NSFetchRequest<Budget> {
        let request = Budget.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
}
