//
//  BeanRowView.swift
//  Brewnary
//
//  Created by 박진홍 on 4/25/25.
//

import SwiftUI

struct BeanListRowView: View {
    let beanData: BeanListRowDto
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(beanData.name)
                .bold()
                .font(.system(size: UIMetric.FontSize.subTitle))
            Text(beanData.roaster)
                .font(.system(size: UIMetric.FontSize.body))
            Text(beanData.date.toIso8601Date())
                .font(.system(size: UIMetric.FontSize.caption))
            
        }
        .padding(.horizontal, UIMetric.Padding.regular)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical,UIMetric.Padding.regular)
        .background {
            RoundedRectangle(cornerRadius: UIMetric.CornerRadius.regular)
                .foregroundStyle(.gray)
        }
    }
}

#if DEBUG
struct BeanListRowPreview: PreviewProvider {
    static var previews: some View {
        BeanListRowView(beanData: BeanListRowDto(id: UUID(), name: "hello", roaster: "world", date: Date.now))
    }
}
#endif

