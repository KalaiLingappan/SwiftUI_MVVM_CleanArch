//
//  RowItem.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 05/01/24.
//

import SwiftUI

struct RowItem: View {
    let property: Property
    
    var body: some View {
        HStack {
            AsyncImageView(url: property.picture_url?.pictureURL)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(property.name)
                    .font(.headline)
                Text("Rating: \(property.review_scores_rating ?? 0)")
                    .foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
