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
    var mockBookNetworkService: MockBookNetworkService!
    var mockRepo: BookRepositoryImpl!
    
    override func setUp() {
        super.setUp()
        
        mockBookNetworkService = MockBookNetworkService()
        mockRepo = BookRepositoryImpl(bookNetworkService: mockBookNetworkService)
    }
    
    override func tearDown() {
        super.tearDown()
       
        mockBookNetworkService = nil
        mockRepo = nil
    }
    
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
