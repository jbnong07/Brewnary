//
//  Untitled.swift
//  Brewnary
//
//  Created by 박진홍 on 4/23/25.
//

import CoreData

final class CoreDataRepository<T: NSManagedObject> {
    private let contextProvider: () -> NSManagedObjectContext
    
    init(contextProvider: @escaping () -> NSManagedObjectContext) {
        self.contextProvider = contextProvider
    }
    
    func createEntity() async throws -> T {
        let context: NSManagedObjectContext = contextProvider()
        
        return try await context.perform {
            let entity: T = T(context: context)
            do {
                try context.save()
                return entity
            } catch {
                let name: String = T.entity().name ?? "\(T.self)"
                throw CoreDataError.failedToCreate(entityName: name)
            }
        }
    }
    
    func fetchEntityById(_ id: String?) async throws -> T {
            let context: NSManagedObjectContext = contextProvider()
            return try await context.perform {
                do {
                    let entity: T = try Self.resolveEntity(id: id, in: context)
                    return entity
                } catch {
                    throw error
                }
            }
    }
    
    func fetchAllEntities(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) async throws -> [T] {
        let context: NSManagedObjectContext = contextProvider()
        return try await context.perform {
            let entityName: String = String(describing: T.self)
            let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName)
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                let entities: [T] = try context.fetch(fetchRequest)
                return entities
            } catch {
                throw CoreDataError.failedToFetch(underlying: error)
            }
        }
    }
    
    func deleteEntityById(id: String?) async throws {
        let context: NSManagedObjectContext = contextProvider()
        try await context.perform {
            do {
                let entity: NSManagedObject = try Self.resolveEntity(id: id, in: context)
                context.delete(entity)
                try Self.saveIfNeeded(context: context)
            } catch {
                throw error
            }
        }
    }
    
    func updateEntity(id: String?, updateBlock: @escaping (T) -> Void) async throws {
        let context: NSManagedObjectContext = contextProvider()
        try await context.perform {
            do {
                let entity: T = try Self.resolveEntity(id: id, in: context)
                updateBlock(entity)
                try Self.saveIfNeeded(context: context)
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
