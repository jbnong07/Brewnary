//
//  BeanView.swift
//  Brewnary
//
//  Created by 박진홍 on 4/25/25.
//

import SwiftUI

struct BeanView: View {
    @StateObject var viewModel: BeanViewModel
    
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            BeanSearchBarView(searchText: $searchText)
            BeanListView(listData: viewModel.beanList, onSelect: viewModel.navigateToDetail(id:))
        }
    }
}

#if DEBUG
struct BeanViewPreview: PreviewProvider {
    static var previews: some View {
        BeanView(viewModel: BeanViewModel(beanService: BeanService())) 
    }
}
#endif
