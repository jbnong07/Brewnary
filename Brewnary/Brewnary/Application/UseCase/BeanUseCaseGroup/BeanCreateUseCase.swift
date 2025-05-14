//
//  BeanService.swift
//  Brewnary
//
//  Created by 박진홍 on 5/2/25.
//

import CoreData

final class CreateBeanUseCase {
    private let beanRepository: BeanRepository
    private let flavorRepository: FlavorRepository
    
    init(beanRepository: BeanRepository, flavorRepository: FlavorRepository, context: NSManagedObjectContext) {
        self.beanRepository = beanRepository
        self.flavorRepository = flavorRepository
    }
    
    // 입력을 받아서 레포지토리를 통해 코어데이터 엔티티를 생성할 것.
    func execute(input: BeanInput) async throws {
        let bean: Bean = try Bean.create(
            id: input.id,
            name: input.name,
            price: input.price,
            degassingDate: input.degassingDate,
            openedDate: input.openedDate,
            roasterId: input.roasterId,
            roastLevelId: input.roastLevelId,
            storageTypeId: input.storageTypeId,
            flavorIds: input.flavorIds
        )
        
        var flavors: [FlavorEntity] = []
        
        for id in input.flavorIds {
            try await flavors.append(
                flavorRepository.fetchEntity(by: id)
            )
        }
        
        try await beanRepository.create(by: bean, with: flavors)
    }
}
