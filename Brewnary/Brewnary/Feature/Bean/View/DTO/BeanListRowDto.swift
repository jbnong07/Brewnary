//
//  ListRowDto.swift
//  Brewnary
//
//  Created by 박진홍 on 5/8/25.
//

import Foundation

struct BeanListRowDto:Identifiable, Hashable {
    let id: UUID
    let name: String
    let roaster: String
    let date: Date
}
