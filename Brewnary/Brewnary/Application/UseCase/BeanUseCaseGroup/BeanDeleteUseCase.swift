//
//  BeanDeleteUseCase.swift
//  Brewnary
//
//  Created by 박진홍 on 5/15/25.
//

import Foundation

final class BeanDeleteUseCase {
    private let beanRepository: BeanRepository
    
    init(beanRepository: BeanRepository) {
        self.beanRepository = beanRepository
    }
    
    func execute(id: UUID) async throws {
        try await beanRepository.deleteById(id)
    }
}
