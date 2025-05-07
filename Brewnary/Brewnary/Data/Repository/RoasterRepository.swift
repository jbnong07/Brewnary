//
//  RoasterRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//


import CoreData

final class RoasterRepository: RepositoryType {
    typealias Model = Roaster
    typealias EntityType = RoasterEntity
    typealias Mapper = RoasterMapper
    
    let context: NSManagedObjectContext
    let coreDataRepository: CoreDataRepository<RoasterEntity>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
}
