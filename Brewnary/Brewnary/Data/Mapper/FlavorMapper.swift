//
//  FlavorMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

import CoreData

struct FlavorMapper {
    static func map(from entity: FlavorEntity) throws -> Flavor {
        guard let name = entity.name
        else {
            throw MappingError.missingField("Flavor.name")
        }
        
        guard let id = entity.id
        else {
            throw MappingError.missingField("Flavor.id")
        }
        return Flavor(id: id, name: name)
    }
    
    static func update(from model: Flavor, to entity: FlavorEntity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.name, model.name)
    }
}
