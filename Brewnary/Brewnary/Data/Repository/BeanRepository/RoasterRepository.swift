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
    
    let coreDataRepository: CoreDataRepository<RoasterEntity>
    
    init(coreDataRepository: CoreDataRepository<RoasterEntity>) {
        self.coreDataRepository = coreDataRepository
    }
}
