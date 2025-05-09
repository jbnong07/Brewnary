//
//  FlavorRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

import CoreData

final class FlavorRepository: RepositoryType {
    typealias Model = Flavor
    typealias EntityType = FlavorEntity
    typealias Mapper = FlavorMapper
    
    let context: NSManagedObjectContext
    let coreDataRepository: CoreDataRepository<FlavorEntity>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
}

