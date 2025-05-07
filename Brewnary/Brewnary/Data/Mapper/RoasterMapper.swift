//
//  RoasterMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

struct RoasterMapper: MapperType {
    typealias Model = Roaster
    typealias Entity = RoasterEntity
    
    static func map(from entity: Entity) throws -> Model {
        guard let name = entity.name
        else {
            throw MappingError.missingField("Roaster.name")
        }
        guard let id = entity.id
        else {
            throw MappingError.missingField("Roaster.id")
        }
        return Model(id: id, name: name)
    }
    
    static func update(from model: Model, to entity: Entity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.name, model.name)
    }
}
