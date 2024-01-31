//
//  MockBookNetworkService.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 22/01/24.
//

@testable import SwiftUI_MVVM_CleanArch

final class MockBookNetworkService: BookNetworkService {
    var mockBookDataDTO: [BookDataDTO] = []
    var mockError: Error?
    
    func fetchBooks() async throws -> [BookDataDTO] {
        if let error = mockError {
            throw error
        }
        return mockBookDataDTO
    }
}
