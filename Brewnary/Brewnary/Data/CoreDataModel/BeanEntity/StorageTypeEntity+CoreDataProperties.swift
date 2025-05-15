//
//  StorageTypeEntity+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//
//

import Foundation
import CoreData


extension StorageTypeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StorageTypeEntity> {
        return NSFetchRequest<StorageTypeEntity>(entityName: "StorageType")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var method: String?
    @NSManaged public var bean: BeanEntity?

}
