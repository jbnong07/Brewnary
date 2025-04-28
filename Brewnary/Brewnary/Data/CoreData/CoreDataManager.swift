//
//  CoredataManager.swift
//  Brewnary
//
//  Created by 박진홍 on 4/22/25.
//

import CoreData

final class CoreDataManager {
    private let containerName: String = "DataModel"
    private let persistentContainer: NSPersistentContainer
    
    static let shared: CoredataManager = CoredataManager()
    
    private init() {
        self.persistentContainer = NSPersistentContainer(name: containerName)
    }
    
    func getBackgroundContext() -> NSManagedObjectContext {
        let context: NSManagedObjectContext =  persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return context
    }
}

