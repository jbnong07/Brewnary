//
//  CoreDataError.swift
//  Brewnary
//
//  Created by 박진홍 on 4/22/25.
//

import Foundation

enum CoreDataError: LocalizedError { // CRUD에 대한 실패
    case failedToCreate(entityName: String)
    case failedToSaveContext(underlying: Error)
    case failedToCovertId
    case failedToFetch(underlying: Error)
    case entityNotFound
    
    var errorDescription: String? {
        switch self {
        case .failedToCreate(let name): "엔티티 \(name)을 생성하지 못했습니다."
        case .failedToSaveContext(let error): "컨텍스트에 저장하지 못했습니다.: \(error.localizedDescription)"
        case .failedToCovertId: "id 변환에 실패했습니다."
        case .failedToFetch(let error): "엔티티를 가져오지 못했습니다.: \(error.localizedDescription)"
        default: "코어데이터에서 알 수 없는 에러"
        }
    }
}
