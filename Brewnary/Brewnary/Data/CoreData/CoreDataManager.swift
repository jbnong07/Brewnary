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
    let sharedBackgroundContext: NSManagedObjectContext
    
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        self.persistentContainer = NSPersistentContainer(name: containerName)
        self.sharedBackgroundContext = persistentContainer.newBackgroundContext()
        self.sharedBackgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}

