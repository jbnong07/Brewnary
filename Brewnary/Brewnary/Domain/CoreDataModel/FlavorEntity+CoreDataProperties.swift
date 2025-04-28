//
//  FlavorEntity+CoreDataProperties.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//
//

import Foundation
import CoreData


extension FlavorEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlavorEntity> {
        return NSFetchRequest<FlavorEntity>(entityName: "Flavor")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var bean: NSSet?

}

// MARK: Generated accessors for bean
extension FlavorEntity {

    @objc(addBeanObject:)
    @NSManaged public func addToBean(_ value: BeanEntity)

    @objc(removeBeanObject:)
    @NSManaged public func removeFromBean(_ value: BeanEntity)

    @objc(addBean:)
    @NSManaged public func addToBean(_ values: NSSet)

    @objc(removeBean:)
    @NSManaged public func removeFromBean(_ values: NSSet)

}
