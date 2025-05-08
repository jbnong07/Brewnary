//
//  BeanRowView.swift
//  Brewnary
//
//  Created by 박진홍 on 4/25/25.
//

import SwiftUI

struct BeanListRowView: View {
    private let name: String
    private let roaster: String
    private let date: Date
    
    init(name: String, roaster: String, date: Date) {
        self.name = name
        self.roaster = roaster
        self.date = date
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .bold()
                .font(.system(size: UIMetric.FontSize.subTitle))
            Text(roaster)
                .font(.system(size: UIMetric.FontSize.body))
            Text(date.toIso8601Date())
                .font(.system(size: UIMetric.FontSize.caption))
            
        }
        .padding(.horizontal, UIMetric.Padding.regular)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical,UIMetric.Padding.regular)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.gray)
        }
    }
    
}

#if DEBUG
struct BeanListPreview: PreviewProvider {
    static var previews: some View {
        BeanListRowView(date: BeanListRowDto(id: UUID(), name: "hello", roaster: "world", date: Date.now))
    }
}
#endif

