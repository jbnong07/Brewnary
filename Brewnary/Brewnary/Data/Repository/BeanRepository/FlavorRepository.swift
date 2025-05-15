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
    
    let coreDataRepository: CoreDataRepository<FlavorEntity>
    
    init(coreDataRepository: CoreDataRepository<FlavorEntity>) {
        self.coreDataRepository = coreDataRepository
    }
    
    func fetchEntity(by id: UUID) async throws -> Entity {
        return try await coreDataRepository.fetchEntityById(id)
    }
    
    func fetchEntities(by ids: [UUID]) async throws -> [Entity] {
        var entites: [Entity] = []
        
        for id in ids {
            try await entites.append(coreDataRepository.fetchEntityById(id))
        }
        
        return entites
    }
}

