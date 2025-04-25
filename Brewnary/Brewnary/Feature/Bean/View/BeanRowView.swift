//
//  BeanRowView.swift
//  Brewnary
//
//  Created by 박진홍 on 4/25/25.
//

import SwiftUI

struct BeanRowView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("hello world")
            }
        }
    }
}

#if DEBUG
struct BeanRowPreview: PreviewProvider {
    static var previews: some View {
        BeanRowView()
    }
}
#endif

