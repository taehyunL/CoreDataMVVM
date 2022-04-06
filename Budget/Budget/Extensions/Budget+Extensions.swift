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
        let sortDescriptor = NSSortDescriptor(key: "total", ascending: false)//원하는 attribute 기준으로 순서 정하기
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    
}
