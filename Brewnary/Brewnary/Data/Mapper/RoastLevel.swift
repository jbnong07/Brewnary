//
//  RoastLevel.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

struct RoastLevelMapper {
    static func map(from entity: RoastLevelEntity) throws -> RoastLevel {
        guard let level = entity.level
        else {
            throw MappingError.missingField("RoastLevel.level")
        }
        guard let id = entity.id
        else {
            throw MappingError.missingField("RoastLevel.id")
        }
        return RoastLevel(id: id, level: level)
    }
    
    static func update(from model: RoastLevel, to entity: RoastLevelEntity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.level, model.level)
    }
}
