//
//  Mapper.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

protocol MapperType {
    associatedtype Model
    associatedtype Entity
    static func map(from entity: Entity) throws -> Model
    static func update(from model: Model, to entity: Entity)
}
