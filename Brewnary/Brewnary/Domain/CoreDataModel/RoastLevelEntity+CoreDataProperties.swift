//
//  RoastLevelEntity+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//
//

import Foundation
import CoreData


extension RoastLevelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoastLevelEntity> {
        return NSFetchRequest<RoastLevelEntity>(entityName: "RoastLevel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var level: String?
    @NSManaged public var bean: NSSet?

}

// MARK: Generated accessors for bean
extension RoastLevelEntity {

    @objc(addBeanObject:)
    @NSManaged public func addToBean(_ value: BeanEntity)

    @objc(removeBeanObject:)
    @NSManaged public func removeFromBean(_ value: BeanEntity)

    @objc(addBean:)
    @NSManaged public func addToBean(_ values: NSSet)

    @objc(removeBean:)
    @NSManaged public func removeFromBean(_ values: NSSet)

}
