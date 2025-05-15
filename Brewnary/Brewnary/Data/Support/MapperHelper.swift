//
//  AssignHelper.swift
//  Brewnary
//
//  Created by 박진홍 on 4/30/25.
//

import CoreData

enum MapperHelper {
    static func assign<Entity: NSManagedObject, Value>(
        _ entity: Entity,
        _ keyPath: ReferenceWritableKeyPath<Entity, Value?>,
        _ value: Value?
    ) {
        entity[keyPath: keyPath] = value
    }
    
    static func assign<Entity: NSManagedObject, Value>(
        _ entity: Entity,
        _ keyPath: ReferenceWritableKeyPath<Entity, Value>, // Value?
        _ value: Value
    ) {
        entity[keyPath: keyPath] = value
    }
}

// 트러블 슈팅 간단히 작성 후 나머지 이어서 완성
