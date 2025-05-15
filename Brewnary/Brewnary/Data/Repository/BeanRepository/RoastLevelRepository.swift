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

    let coreDataRepository: CoreDataRepository<EntityType>
    
    init(coreDataRepository: CoreDataRepository<EntityType>) {
        self.coreDataRepository = coreDataRepository
    }
}
