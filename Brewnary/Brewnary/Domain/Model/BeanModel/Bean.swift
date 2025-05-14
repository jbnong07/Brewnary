//
//  BeanModel.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//

import Foundation

struct Bean: Identifiable, Equatable, ModelType {
    let id: UUID
    let name: String
    let price: Int
    let degassingDate: Int
    let openedDate: Date?
    let isConsumed: Bool
    let roasterId: UUID?
    let roastLevelId: UUID?
    let storageTypeId: UUID?
    let flavorIds: [UUID]
    
    private init(
        id: UUID,
        name: String,
        price: Int,
        degassingDate: Int,
        openedDate: Date?,
        roasterId: UUID?,
        roastLevelId: UUID?,
        storageTypeId: UUID?,
        isConsumed: Bool,
        flavorIds: [UUID]
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.degassingDate = degassingDate
        self.openedDate = openedDate
        self.isConsumed = isConsumed
        self.roasterId = roasterId
        self.roastLevelId = roastLevelId
        self.storageTypeId = storageTypeId
        self.flavorIds = flavorIds
    }
    
    static func create(
        id: UUID,
        name: String,
        price: Int,
        degassingDate: Int,
        openedDate: Date?,
        isConsumed: Bool = false,
        roasterId: UUID?,
        roastLevelId: UUID?,
        storageTypeId: UUID?,
        flavorIds: [UUID]
    ) throws -> Bean {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, trimmed.count < 20 else {
            throw BeanError.invalidName
        }
        guard price >= 0 else {
            throw BeanError.invalidPrice
        }
        guard degassingDate >= 0 else {
            throw BeanError.invalidDegassingDate
        }
        if let openedDate = openedDate,
           openedDate > Date.now {
            throw BeanError.invalidOpenedDate
        }
       
        return Bean(
            id: id,
            name: name,
            price: price,
            degassingDate: degassingDate,
            openedDate: openedDate,
            roasterId: roasterId,
            roastLevelId: roastLevelId,
            storageTypeId: storageTypeId,
            isConsumed: isConsumed,
            flavorIds: flavorIds
        )
    }
}
