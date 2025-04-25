//
//  BeanSearchBarView.swift
//  Brewnary
//
//  Created by 박진홍 on 4/25/25.
//

import SwiftUI

struct BeanSearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(searchText)
        }
    }
}

#if DEBUG
struct BeanSearchPreview: PreviewProvider {
    static var previews: some View {
        BeanSearchBarView(searchText: .constant("hello world"))
    }
}
#endif
