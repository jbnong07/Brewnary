//
//  BeanFetchUseCase.swift
//  Brewnary
//
//  Created by 박진홍 on 5/15/25.
//

final class BeanFetchAllUseCase {
    private let beanRepository: BeanRepository
    
    init(beanRepository: BeanRepository) {
        self.beanRepository = beanRepository
    }
    
    func execute() async throws -> [Bean] {
        return try await beanRepository.fetchAll()
    }
}
