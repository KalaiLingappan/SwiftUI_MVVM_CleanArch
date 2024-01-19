//
//  BooksListDashboardView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 03/01/24.
//

import SwiftUI
import NetworkManager

struct BooksListDashboardView: View {
    @ObservedObject var bookListViewModel: BookListViewModel
    
    init(listViewModel: BookListViewModel) {
        self.bookListViewModel = listViewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !bookListViewModel.errorMessage.isEmpty {
                    ErrorView(errorMessage: bookListViewModel.errorMessage)
                }
                else {
                    BookListView(bookList: bookListViewModel.booksList)
                }
            }
            .task {
                await bookListViewModel.fetchData()
            }
        }
    }
}
