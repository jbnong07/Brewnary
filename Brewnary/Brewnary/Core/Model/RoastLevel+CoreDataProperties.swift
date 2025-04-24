//
//  RoastLevel+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/22/25.
//
//

import Foundation
import CoreData


extension RoastLevel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoastLevel> {
        return NSFetchRequest<RoastLevel>(entityName: "RoastLevel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var level: String?
    @NSManaged public var bean: NSSet?

}

// MARK: Generated accessors for bean
extension RoastLevel {

    @objc(addBeanObject:)
    @NSManaged public func addToBean(_ value: Bean)

    @objc(removeBeanObject:)
    @NSManaged public func removeFromBean(_ value: Bean)

    @objc(addBean:)
    @NSManaged public func addToBean(_ values: NSSet)

    @objc(removeBean:)
    @NSManaged public func removeFromBean(_ values: NSSet)

}
