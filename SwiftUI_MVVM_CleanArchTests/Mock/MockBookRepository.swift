//
//  MockBookRepository.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 22/01/24.
//

@testable import SwiftUI_MVVM_CleanArch

final class MockBookRepository: BookRepository {
    var mockBookDomainDTO: [BookDomainDTO] = []
    var mockError: Error?
    
    func fetchBooks() async throws -> [BookDomainDTO] {
        if let error = mockError {
            throw error
        }
        return mockBookDomainDTO
    }
}
