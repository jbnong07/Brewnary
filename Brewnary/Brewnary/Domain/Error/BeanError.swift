//
//  BeanError.swift
//  Brewnary
//
//  Created by 박진홍 on 5/13/25.
//

import Foundation

enum BeanError: LocalizedError {
    case invalidName
    case invalidPrice
    case invalidDegassingDate
    case invalidOpenedDate
    case invalidFlavor
    case missingReference(type: String, id: UUID)
    
    var errorDescription: String? {
        switch self {
        case .invalidName: "조건에 맞지 않는 이름입니다."
        case .invalidPrice: "조건에 맞지 않는 가격입니다."
        case .invalidDegassingDate: "디개싱 날짜가 음수입니다."
        case .invalidOpenedDate: "조건에 맞지 않는 개봉일입니다."
        case .missingReference(let type, let id): "\(type)이(가) 잘못되었습니다."
        default: "원두 추가에 실패했습니다."
        }
    }
}
