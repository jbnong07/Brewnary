//
//  BeanRepository.swift
//  Brewnary
//
//  Created by 박진홍 on 5/6/25.
//

import CoreData

final class BeanRepository: RepositoryType {
    typealias Model = Bean
    typealias EntityType = BeanEntity
    typealias Mapper = BeanMapper
    
    let context: NSManagedObjectContext
    let coreDataRepository: CoreDataRepository<BeanEntity>
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataRepository = CoreDataRepository(context: context)
    }
    
    func updateBean(to bean: Bean, with flavor: [FlavorEntity]) async throws {
        try await coreDataRepository.updateEntity(id: bean.id) { entity in
            BeanMapper.update(from: bean, to: entity, with: flavor)
        }
    }
}
