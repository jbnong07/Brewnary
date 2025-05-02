//
//  MappingError.swift
//  Brewnary
//
//  Created by 박진홍 on 4/28/25.
//

import Foundation

enum MappingError: LocalizedError {
    case missingField(String)
    
    var errorDescription: String? {
        switch self {
        case .missingField(let field): "매핑에 실패했습니다.: \(field)"
        }
    }
}
