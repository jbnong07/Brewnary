//
//  Bean+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/22/25.
//
//

import Foundation
import CoreData


extension Bean {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bean> {
        return NSFetchRequest<Bean>(entityName: "Bean")
    }

    @NSManaged public var degassingDate: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var isConsumed: Bool
    @NSManaged public var name: String?
    @NSManaged public var openedDate: Date?
    @NSManaged public var price: Int32
    @NSManaged public var roasterId: UUID?
    @NSManaged public var roastLevelId: UUID?
    @NSManaged public var storageTypeId: UUID?
    @NSManaged public var flavor: NSSet?
    @NSManaged public var roaster: Roaster?
    @NSManaged public var roastLevel: RoastLevel?
    @NSManaged public var storageType: StorageType?

}

// MARK: Generated accessors for flavor
extension Bean {

    @objc(addFlavorObject:)
    @NSManaged public func addToFlavor(_ value: Flavor)

    @objc(removeFlavorObject:)
    @NSManaged public func removeFromFlavor(_ value: Flavor)

    @objc(addFlavor:)
    @NSManaged public func addToFlavor(_ values: NSSet)

    @objc(removeFlavor:)
    @NSManaged public func removeFromFlavor(_ values: NSSet)

}
