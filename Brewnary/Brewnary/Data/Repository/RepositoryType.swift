//
//  RepositoryType.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

import CoreData

protocol RepositoryType {
    associatedtype Model: ModelType
    associatedtype Entity: NSManagedObject
    associatedtype Mapper: MapperType where Mapper.Entity == Entity, Mapper.Model == Model
    
    var context: NSManagedObjectContext { get }
    var coreDataRepository: CoreDataRepository<Entity> { get }
    
    init(context: NSManagedObjectContext)
    
    @discardableResult
    func create() async throws -> Model
    func fetchAll() async throws -> [Model]
    func fetchById(_ id: UUID) async throws -> Model
    func deleteById(_ id: UUID) async throws
    func update(from model: Model) async throws
}

extension RepositoryType {
    func create() async throws -> Model {
        let entity: Entity = try await coreDataRepository.createEntity()
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
