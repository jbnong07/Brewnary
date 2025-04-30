//
//  RoasterMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

struct RoasterMapper {
    static func map(from entity: RoasterEntity) throws -> Roaster {
        guard let name = entity.name
        else {
            throw MappingError.missingField("Roaster.name")
        }
        guard let id = entity.id
        else {
            throw MappingError.missingField("Roaster.id")
        }
        return Roaster(id: id, name: name)
    }
    
    static func update(from model: Roaster, to entity: RoasterEntity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.name, model.name)
    }
}
