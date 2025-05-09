//
//  FlavorMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

import CoreData

struct FlavorMapper: MapperType {
    typealias Model = Flavor
    typealias Entity = FlavorEntity
    
    static func map(from entity: Entity) throws -> Model {
        guard let name = entity.name
        else {
            throw MappingError.missingField("Flavor.name")
        }
        
        guard let id = entity.id
        else {
            throw MappingError.missingField("Flavor.id")
        }
        return Model(id: id, name: name)
    }
    
    static func update(from model: Model, to entity: Entity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.name, model.name)
    }
}
