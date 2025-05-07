//
//  RoastLevelRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

import CoreData

final class RoastLevelRepository: RepositoryType {
    typealias Model = RoastLevel
    typealias EntityType = RoastLevelEntity
    typealias Mapper = RoastLevelMapper

    let context: NSManagedObjectContext
    let coreDataRepository: CoreDataRepository<EntityType>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
}
