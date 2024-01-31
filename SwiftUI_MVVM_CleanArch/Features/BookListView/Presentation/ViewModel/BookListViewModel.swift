//
//  ListViewModel.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 04/01/24.
//

import Foundation
import NetworkManager

final class BookListViewModel: ObservableObject {
    @Published var booksList: [Book] = []
    @Published var errorMessage: String = ""
    private let fetchBooksUseCase: FetchBooksUseCase
    
    init(fetchBooksUseCase: FetchBooksUseCase) {
        self.fetchBooksUseCase = fetchBooksUseCase
    }
    
    @MainActor
    func fetchData() async {
        do {
            self.booksList = try await fetchBooksUseCase.execute()
        }
        catch {
            errorMessage = error.localizedDescription
        }
    }
}
