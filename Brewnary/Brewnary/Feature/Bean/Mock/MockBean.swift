//
//  MockBean.swift
//  Brewnary
//
//  Created by 박진홍 on 5/8/25.
//

import Foundation

#if DEBUG
struct MockBeanRowData {
    static let list: [BeanListRowDto] = [
        BeanListRowDto(id: UUID(),name: "에티오피아 예가체프", roaster: "테라로사", date: Date.now),
        BeanListRowDto(id: UUID(),name: "Kenya AA", roaster: "Fritz Coffee", date: Date.now),
        BeanListRowDto(id: UUID(),name: "콜롬비아 수프리모", roaster: "앤트러사이트", date: Date.now),
        BeanListRowDto(id: UUID(),name: "Guatemala Antigua", roaster: "라르고", date: Date.now),
        BeanListRowDto(id: UUID(),name: "Panama Geisha", roaster: "모모스", date: Date.now),
        BeanListRowDto(id: UUID(),name: "브라질 산토스", roaster: "커피 리브레", date: Date.now),
        BeanListRowDto(id: UUID(),name: "Sumatra Mandheling", roaster: "프릇츠", date: Date.now),
        BeanListRowDto(id: UUID(),name: "탄자니아 피베리", roaster: "테라로사", date: Date.now),
        BeanListRowDto(id: UUID(),name: "Honduras Marcala", roaster: "모모스", date: Date.now),
        BeanListRowDto(id: UUID(),name: "르완다 부르봉", roaster: "앤트러사이트", date: Date.now)
    ]
}
#endif

