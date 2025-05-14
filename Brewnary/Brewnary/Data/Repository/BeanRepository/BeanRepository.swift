//
//  BeanRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/6/25.
//

import CoreData

final class BeanRepository: RepositoryType {
    typealias Model = Bean
    typealias EntityType = BeanEntity
    typealias Mapper = BeanMapper
    
    let coreDataRepository: CoreDataRepository<BeanEntity>
    
    init(coreDataRepository: CoreDataRepository<BeanEntity>) {
        self.coreDataRepository = coreDataRepository
    }
    
    @discardableResult
    func create(by model: Model, with flavors: [FlavorEntity]) async throws -> Model {
        let entity = try await coreDataRepository.createEntity { entity in
            Mapper.update(
                from: model,
                to: entity,
                with: flavors
            )
        }

        return try Mapper.map(from: entity)
    }
    
    func update(to bean: Bean, with flavor: [FlavorEntity]) async throws {
        try await coreDataRepository.updateEntity(id: bean.id) { entity in
            BeanMapper.update(from: bean, to: entity, with: flavor)
        }
    }
}
