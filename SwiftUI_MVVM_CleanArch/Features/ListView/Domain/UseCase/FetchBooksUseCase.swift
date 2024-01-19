//
//  BookUseCaseProtocol.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 10/01/24.
//

import NetworkManager

protocol FetchBooksUseCase {
    func execute() async throws -> [Book]
}

class FetchBooksUseCaseImpl: FetchBooksUseCase {
    private let bookRepository: BookRepository

    init(bookRepository: BookRepository) {
        self.bookRepository = bookRepository
    }
    
    func execute() async throws -> [Book] {
        try await bookRepository.fetchBooks()
                                .map({ $0.book() })
    }
}
