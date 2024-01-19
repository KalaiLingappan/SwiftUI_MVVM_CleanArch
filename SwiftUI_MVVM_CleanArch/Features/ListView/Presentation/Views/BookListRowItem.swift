//
//  BookListRowItem.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 05/01/24.
//

import SwiftUI

struct BookListRowItem: View {
    let bookDetail: Book
    
    var body: some View {
        HStack {
            AsyncImageView(url: bookDetail.imageURL)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(bookDetail.title)
                    .font(.headline)
                Text(bookDetail.publisher ?? "")
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
