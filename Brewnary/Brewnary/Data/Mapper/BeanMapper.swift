//
//  BeanMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//

import Foundation
import CoreData

struct BeanMapper {
    static func map(from entity: BeanEntity) throws -> Bean {
        guard let id = entity.id else {
            throw MappingError.missingField("BeanEntity.id")
        }
        guard let name = entity.name else {
            throw MappingError.missingField("BeanEntity.name")
        }
        let flavorSet = (entity.flavor as? Set<FlavorEntity>) ?? []
        
        return Bean(
            id:             id,
            name:           name,
            price:          Int(entity.price),
            degassingDate:  Int(entity.degassingDate),
            openedDate:     entity.openedDate,
            isConsumed:     entity.isConsumed,
            roasterId:      entity.roaster?.id,
            roastLevelId:   entity.roastLevel?.id,
            storageTypeId:  entity.storageType?.id,
            flavorIds:      flavorSet.compactMap { $0.id }
        )
    }
    
}
