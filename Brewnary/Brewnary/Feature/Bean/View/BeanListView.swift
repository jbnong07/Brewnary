//
//  BeanListView.swift
//  Brewnary
//
//  Created by 박진홍 on 5/7/25.
//

import SwiftUI

struct BeanListView: View {
    let listData: [BeanListRowDto]
    let onSelect: (UUID) -> Void
    
    var body: some View {
        List {
            ForEach(listData, id: \.id) { beanRowData in
                Button {
                    onSelect(beanRowData.id)
                } label: {
                    BeanListRowView(beanData: beanRowData)
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#if DEBUG
struct BeanListPreview: PreviewProvider {
    static var previews: some View {
        BeanListView(listData: MockBeanRowData.list) { _ in
        }
    }
}
#endif
