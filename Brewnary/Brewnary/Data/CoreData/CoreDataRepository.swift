//
//  Untitled.swift
//  Brewnary
//
//  Created by 박진홍 on 4/23/25.
//

import CoreData

final class CoreDataRepository<T: NSManagedObject> {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    @discardableResult
    func createEntity() async throws -> T {
        try await context.perform {
            let entity: T = T(context: self.context)
            do {
                try self.context.save()
                return entity
            } catch {
                let name: String = T.entity().name ?? "\(T.self)"
                throw CoreDataError.failedToCreate(entityName: name)
            }
        }
    }
    
    func fetchEntityById(_ id: UUID) async throws -> T {
        try await context.perform {
            do {
                let entity: T = try Self.resolveEntity(id: id, in: self.context)
                return entity
            } catch {
                throw error
            }
        }
    }
    
    func fetchAllEntities(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) async throws -> [T] {
        try await context.perform {
            let entityName: String = String(describing: T.self)
            let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName)
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                let entities: [T] = try self.context.fetch(fetchRequest)
                return entities
            } catch {
                throw CoreDataError.failedToFetch(underlying: error)
            }
        }
    }
    
    func deleteEntityById(_ id: UUID) async throws {
        try await context.perform {
            do {
                let entity: NSManagedObject = try Self.resolveEntity(id: id, in: self.context)
                self.context.delete(entity)
                try Self.saveIfNeeded(context: self.context)
            } catch {
                throw error
            }
        }
    }
    
    func updateEntity(id: UUID, updateBlock: @escaping (T) -> Void) async throws {
        try await context.perform {
            do {
                let entity: T = try Self.resolveEntity(id: id, in: self.context)
                updateBlock(entity)
                try Self.saveIfNeeded(context: self.context)
            } catch {
                throw error
            }
        }
    }
}

// MARK: -- helper method

private extension CoreDataRepository {
    static func saveIfNeeded(context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
    @available(*, deprecated, message: "UUID 기반 resolveEntity(id:)로 대체되었습니다.")
    static func resolveEntity(id: String?, in context: NSManagedObjectContext) throws -> T {
        do {
            let objectId: NSManagedObjectID = try Self.toNSManagedObjectID(from: id, in: context)
            guard let entity = try context.existingObject(with: objectId) as? T else {
                throw CoreDataError.entityNotFound
            }
            return entity
        } catch {
            throw error
        }
    }
    
    static func resolveEntity(id: UUID, in context: NSManagedObjectContext) throws -> T {
        let request = NSFetchRequest<T>(entityName: String(describing: T.self))
        request.predicate = NSPredicate(format: "uuid == %@", id as CVarArg)
        request.fetchLimit = 1
        
        guard let result = try context.fetch(request).first else {
            throw CoreDataError.entityNotFound
        }
        
        return result
    }

    static func toNSManagedObjectID(from id: String?, in context: NSManagedObjectContext) throws -> NSManagedObjectID {
        guard let id = id,
              let url = URL(string: id),
              let convertedID = context.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: url)
        else {
            throw CoreDataError.failedToCovertId
        }
        return convertedID
    }
    
    static func toStringID(from id: NSManagedObjectID?) -> String {
        guard let id = id else { return "" }
        return id.uriRepresentation().absoluteString
    }
}
