//
//  RoastLevel.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

struct RoastLevelMapper: MapperType {
    typealias Model = RoastLevel
    typealias Entity = RoastLevelEntity
    
    static func map(from entity: Entity) throws -> Model {
        guard let level = entity.level
        else {
            throw MappingError.missingField("RoastLevel.level")
        }
        guard let id = entity.id
        else {
            throw MappingError.missingField("RoastLevel.id")
        }
        return Model(id: id, level: level)
    }
    
    static func update(from model: Model, to entity: Entity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.level, model.level)
    }
}
