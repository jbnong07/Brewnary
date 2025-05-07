//
//  BeanRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/6/25.
//

import CoreData

final class BeanRepository {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext?) {
        if let context = context {
            self.context = context
        } else {
            self.context = CoreDataManager.shared.getBackgroundContext()
        }
    }
}
