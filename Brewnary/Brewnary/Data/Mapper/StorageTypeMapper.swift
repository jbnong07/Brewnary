//
//  StorageTypeMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

struct StorageTypeMapper: MapperType {
    typealias Model = StorageType
    typealias Entity = StorageTypeEntity
    
    static func map(from entity: Entity) throws -> Model {
        guard let id = entity.id
        else {
            throw MappingError.missingField("StroageType.id")
        }
        guard let method = entity.method
        else {
            throw MappingError.missingField("StorageType.method")
        }
        return Model(id: id, method: method)
    }
    
    static func update(from model: Model, to entity: Entity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.method, model.method)
    }
}
