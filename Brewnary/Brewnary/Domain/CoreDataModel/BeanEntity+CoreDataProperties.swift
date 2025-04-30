//
//  BeanEntity+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//
//

import Foundation
import CoreData


extension BeanEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BeanEntity> {
        return NSFetchRequest<BeanEntity>(entityName: "Bean")
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
    @NSManaged public var roaster: RoasterEntity?
    @NSManaged public var roastLevel: RoastLevelEntity?
    @NSManaged public var storageType: StorageTypeEntity?
    
    var flavorIds: [UUID] {
        (flavor as? Set<FlavorEntity>)?.compactMap { $0.id } ?? []
    }

}

// MARK: Generated accessors for flavor
extension BeanEntity {

    @objc(addFlavorObject:)
    @NSManaged public func addToFlavor(_ value: FlavorEntity)

    @objc(removeFlavorObject:)
    @NSManaged public func removeFromFlavor(_ value: FlavorEntity)

    @objc(addFlavor:)
    @NSManaged public func addToFlavor(_ values: NSSet)

    @objc(removeFlavor:)
    @NSManaged public func removeFromFlavor(_ values: NSSet)

}
