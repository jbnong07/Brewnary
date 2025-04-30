//
//  StorageTypeMapper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

struct StorageTypeMapper {
    static func map(from entity: StorageTypeEntity) throws -> StorageType {
        guard let id = entity.id
        else {
            throw MappingError.missingField("StroageType.id")
        }
        guard let method = entity.method
        else {
            throw MappingError.missingField("StorageType.method")
        }
        return StorageType(id: id, method: method)
    }
    
    static func update(from model: StorageType, to entity: StorageTypeEntity) {
        MapperHelper.assign(entity, \.id, model.id)
        MapperHelper.assign(entity, \.method, model.method)
    }
}
