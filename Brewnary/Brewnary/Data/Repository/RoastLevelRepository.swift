//
//  RoastLevelRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

import CoreData

final class RoastLevelRepository {
    typealias Model = RoastLevel
    typealias EntityType = RoastLevelEntity
    typealias Mapper = RoastLevelMapper

    private let context: NSManagedObjectContext
    private let coreDataRepository: CoreDataRepository<EntityType>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
    
    @discardableResult
    func createBean() async throws -> Model {
        let entity: EntityType = try await coreDataRepository.createEntity()
        return try Mapper.map(from: entity)
    }
    
    func fetchAllBean() async throws -> [Model] {
        let entities: [EntityType] = try await coreDataRepository.fetchAllEntities()
        return try entities.map { entity in
            try Mapper.map(from: entity)
        }
    }
    
    func fetchBeanByID(_ id: UUID) async throws -> Model {
        let entity: EntityType = try await coreDataRepository.fetchEntityById(id)
        return try Mapper.map(from: entity)
    }
    
    func deleteBeanByID(_ id: UUID) async throws {
        try await coreDataRepository.deleteEntityById(id)
    }
    
    // TODO: with에 flavorEntity 넣어야 함
    func updateBean(to flavor: Model) async throws {
        try await coreDataRepository.updateEntity(id: flavor.id) { entity in
            Mapper.update(from: flavor, to: entity)
        }
    }
}
