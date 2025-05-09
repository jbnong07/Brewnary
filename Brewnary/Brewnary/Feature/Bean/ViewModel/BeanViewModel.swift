//
//  BeanViewModel.swift
//  Brewnary
//
//  Created by 박진홍 on 5/9/25.
//

import Foundation

final class BeanViewModel: ObservableObject {
    private(set) var beanList: [BeanListRowDto]
    
    init(beanService: BeanService) {
        self.beanList = MockBeanRowData.list
    }
    
    func navigateToDetail(id: UUID) {
        
    }
}
