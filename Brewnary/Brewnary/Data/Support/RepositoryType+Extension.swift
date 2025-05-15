//
//  RepositoryType+Extension.swift
//  Brewnary
//
//  Created by 박진홍 on 5/9/25.
//

import Foundation

extension RepositoryType {
    @discardableResult
    func create(with model: Model) async throws -> Model {
        let entity: Entity = try await coreDataRepository.createEntity()
        Mapper.update(from: model, to: entity)
        return try Mapper.map(from: entity)
    }
    
    func fetchAll() async throws -> [Model] {
        let entities: [Entity] = try await coreDataRepository.fetchAllEntities()
        return try entities.map { try Mapper.map(from: $0) }
    }
    
    func fetchById(_ id: UUID) async throws -> Model {
        let entity: Entity = try await coreDataRepository.fetchEntityById(id)
        return try Mapper.map(from: entity)
    }
    
    func deleteById(_ id: UUID) async throws {
        try await coreDataRepository.deleteEntityById(id)
    }
    
    func update(from model: Model) async throws {
        try await coreDataRepository.updateEntity(id: model.id) { entity in
            Mapper.update(from: model, to: entity)
        }
    }
}
