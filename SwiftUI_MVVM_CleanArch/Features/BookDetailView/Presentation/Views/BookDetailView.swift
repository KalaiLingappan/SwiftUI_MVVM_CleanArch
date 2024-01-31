//
//  BookDetailView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 31/01/24.
//

import SwiftUI

struct BookDetailView: View {
    let bookDetail: Book

    var body: some View {
        ScrollView {
            VStack {
                AsyncImageView(url: bookDetail.imageURL)
                    .frame(maxHeight: 400)
                VStack(alignment: .leading, spacing: 5) {
                    Text(bookDetail.title)
                        .font(.headline)
                    if let subtitle = bookDetail.subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                    }
                    Text(bookDetail.publisher ?? "")
                        .foregroundColor(.gray)
                    
                    if let description = bookDetail.description {
                        Text(description)
                            .font(.caption)
                    }
                }
                .padding(20)
            }
        }
        .navigationBarTitle(Text(bookDetail.title), displayMode: .inline)
    }
}
