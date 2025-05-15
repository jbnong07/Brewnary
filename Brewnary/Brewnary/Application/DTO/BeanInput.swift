//
//  BeanInput.swift
//  Brewnary
//
//  Created by 박진홍 on 5/13/25.
//

import Foundation

struct BeanInput {
    let id: UUID
    let name: String
    let price: Int
    let degassingDate: Int
    let openedDate: Date?
    let isConsumed: Bool
    let roasterId: UUID?
    let roastLevelId: UUID?
    let storageTypeId: UUID?
    let flavorIds: [UUID]
}
