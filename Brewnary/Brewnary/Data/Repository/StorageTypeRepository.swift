//
//  StorageTypeRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

import CoreData

final class StorageTypeRepository: RepositoryType {
    typealias Model = StorageType
    typealias EntityType = StorageTypeEntity
    typealias Mapper = StorageTypeMapper

    let context: NSManagedObjectContext
    let coreDataRepository: CoreDataRepository<EntityType>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
    
}
