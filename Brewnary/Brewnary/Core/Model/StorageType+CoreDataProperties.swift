//
//  StorageType+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/22/25.
//
//

import Foundation
import CoreData


extension StorageType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StorageType> {
        return NSFetchRequest<StorageType>(entityName: "StorageType")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var method: String?
    @NSManaged public var bean: Bean?

}
