//
//  BeanFetchByIdUseCase.swift
//  Brewnary
//
//  Created by 박진홍 on 5/15/25.
//

import Foundation

final class BeanFetchByIdUseCase {
    private let beanRepository: BeanRepository
    
    init(beanRepository: BeanRepository) {
        self.beanRepository = beanRepository
    }
    
    func execute(id: UUID) async throws -> Bean {
        return try await beanRepository.fetchById(id)
    }
}
