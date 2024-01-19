//
//  BookListView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import SwiftUI

struct BookListView: View {
    let bookList: [Book]
    
    var body: some View {
        VStack {
            List(bookList, id: \.bookID) { book in
                BookListRowItem(bookDetail: book)
            }.animation(.easeInOut, value: 1.0)
        }
    }
}
