//
//  SuccessView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import SwiftUI

struct SuccessView: View {
    let title: String
    let propertiesList: [Property]
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontDesign(.serif)
                .bold()
            List(propertiesList, id: \.id) { property in
                NavigationLink(destination: DetailView(property: property)) {
                    RowItem(property: property)
                }
            }.animation(.easeInOut, value: 1.0)
        }
    }
}
