//
//  MockFetchBooksUseCase.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 22/01/24.
//

@testable import SwiftUI_MVVM_CleanArch

final class MockFetchBooksUseCase: FetchBooksUseCase {
    var mockBooks: [Book] = []
    var mockError: Error?
    
    func execute() async throws -> [Book] {
        if let error = mockError {
            throw error
        }
        return mockBooks
    }
}
