//
//  BookRepository.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

import NetworkManager

protocol BookRepository {
    func fetchBooks() async throws -> [BookDomainDTO]
}

final class BookRepositoryImpl: BookRepository {
    private let bookNetworkService: BookNetworkService

    init(bookNetworkService: BookNetworkService) {
        self.bookNetworkService = bookNetworkService
    }

    func fetchBooks() async throws -> [BookDomainDTO] {
        do {
            let booksList = try await bookNetworkService.fetchBooks()
            return booksList.map { $0.domainDTO() }
        } catch {
            throw error
        }
    }
}
