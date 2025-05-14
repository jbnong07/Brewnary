//
//  BeanMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//

import CoreData

struct BeanMapper: MapperType {
    typealias Model = Bean
    typealias Entity = BeanEntity
    
    static func map(from entity: Entity) throws -> Model {
        guard let id = entity.id else {
            throw MappingError.missingField("BeanEntity.id")
        }
        guard let name = entity.name else {
            throw MappingError.missingField("BeanEntity.name")
        }
        let flavorSet = (entity.flavor as? Set<FlavorEntity>) ?? []
        
        return try Model.create(
            id:             id,
            name:           name,
            price:          Int(entity.price),
            degassingDate:  Int(entity.degassingDate),
            openedDate:     entity.openedDate,
            isConsumed:     entity.isConsumed,
            roasterId:      entity.roasterId,
            roastLevelId:   entity.roastLevelId,
            storageTypeId:  entity.storageTypeId,
            flavorIds:      flavorSet.compactMap { $0.id }
        )
    }
    static func update(from model: Model, to entity: Entity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.name, model.name)
        MapperHelper.assign(entity, \.price, Int32(model.price))
        MapperHelper.assign(entity, \.degassingDate, Int16(model.degassingDate))
        MapperHelper.assign(entity, \.openedDate, model.openedDate)
        MapperHelper.assign(entity, \.isConsumed, model.isConsumed)
        MapperHelper.assign(entity, \.roasterId, model.roasterId)
        MapperHelper.assign(entity, \.roastLevelId, model.roastLevelId)
        MapperHelper.assign(entity, \.storageTypeId, model.storageTypeId)
        
        entity.flavor = NSSet(array: [])
    }
    static func update(from model: Model, to entity: Entity, with flavor: [FlavorEntity]) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.name, model.name)
        MapperHelper.assign(entity, \.price, Int32(model.price))
        MapperHelper.assign(entity, \.degassingDate, Int16(model.degassingDate))
        MapperHelper.assign(entity, \.openedDate, model.openedDate)
        MapperHelper.assign(entity, \.isConsumed, model.isConsumed)
        MapperHelper.assign(entity, \.roasterId, model.roasterId)
        MapperHelper.assign(entity, \.roastLevelId, model.roastLevelId)
        MapperHelper.assign(entity, \.storageTypeId, model.storageTypeId)
        
        entity.flavor = NSSet(array: flavor)
    }
}
