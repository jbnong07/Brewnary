//
//  BeanService.swift
//  Brewnary
//
//  Created by 박진홍 on 5/2/25.
//

final class BeanCreateUseCase {
    private let beanRepository: BeanRepository
    private let flavorRepository: FlavorRepository
    
    init(beanRepository: BeanRepository, flavorRepository: FlavorRepository) {
        self.beanRepository = beanRepository
        self.flavorRepository = flavorRepository
    }
    
    func execute(input bean: BeanInput) async throws {
        let bean: Bean = try Bean.create(
            id: bean.id,
            name: bean.name,
            price: bean.price,
            degassingDate: bean.degassingDate,
            openedDate: bean.openedDate,
            roasterId: bean.roasterId,
            roastLevelId: bean.roastLevelId,
            storageTypeId: bean.storageTypeId,
            flavorIds: bean.flavorIds
        )
        
        var flavors: [FlavorEntity] = try await flavorRepository.fetchEntities(by: bean.flavorIds)
        
        try await beanRepository.create(by: bean, with: flavors)
    }
}
