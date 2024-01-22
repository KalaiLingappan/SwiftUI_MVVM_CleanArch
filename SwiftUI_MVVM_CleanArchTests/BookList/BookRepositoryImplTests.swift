//
//  BookRepositoryImplTests.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 20/01/24.
//

import XCTest
import NetworkManager

@testable import SwiftUI_MVVM_CleanArch

final class BookRepositoryImplTests: XCTestCase {
    let mockBookNetworkService = MockBookNetworkService()
    lazy var mockRepo = BookRepositoryImpl(bookNetworkService: mockBookNetworkService)
    
    func testFetchData() async throws {
        mockBookNetworkService.mockBookDataDTO = MockData.bookDataDTO
        
        let result = try await mockRepo.fetchBooks()
        XCTAssertEqual(result.count, 1)
    }

    func testFetchDataWithError() async throws {
        mockBookNetworkService.mockError = ErrorResponse.invalidData
        
        do {
            let _ = try await mockRepo.fetchBooks()
            XCTFail("Success not expected")
        }
        catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
