//
//  BeanRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/6/25.
//

import CoreData

final class BeanRepository {
    private let context: NSManagedObjectContext
    private let coreDataRepository: CoreDataRepository<BeanEntity>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
    
    @discardableResult
    func createBean() async throws -> Bean {
        let entity: BeanEntity = try await coreDataRepository.createEntity()
        return try BeanMapper.map(from: entity)
    }
    
    func fetchAllBean() async throws -> [Bean] {
        let entities: [BeanEntity] = try await coreDataRepository.fetchAllEntities()
        return try entities.map { entity in
            try BeanMapper.map(from: entity)
        }
    }
    
    func fetchBeanByID(_ id: UUID) async throws -> Bean {
        let entity: BeanEntity = try await coreDataRepository.fetchEntityById(id)
        return try BeanMapper.map(from: entity)
    }
    
    func deleteBeanByID(_ id: UUID) async throws {
        try await coreDataRepository.deleteEntityById(id)
    }
    
    // TODO: with에 flavorEntity 넣어야 함
    func updateBean(to bean: Bean, with flavor: [FlavorEntity]) async throws {
        try await coreDataRepository.updateEntity(id: bean.id) { entity in
            BeanMapper.update(from: bean, to: entity, with: flavor)
        }
    }
}
