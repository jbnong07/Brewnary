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

