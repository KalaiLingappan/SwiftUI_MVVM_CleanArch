//
//  BookNetworkServiceImplTests.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 22/01/24.
//

import XCTest
import NetworkManager

@testable import SwiftUI_MVVM_CleanArch

final class BookNetworkServiceImplTests: XCTestCase {
    var mockNetworkService: MockNetworkService!
    var bookNetworkService: BookNetworkServiceImpl!
    
    override func setUp() {
        super.setUp()
        
        mockNetworkService = MockNetworkService()
        bookNetworkService = BookNetworkServiceImpl(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        super.tearDown()
       
        mockNetworkService = nil
        bookNetworkService = nil
    }
    
    func testFetchBooksSuccess() async throws {
        mockNetworkService.mockListDataModel = MockData.bookListDataModel

        let bookListDataModel = try await bookNetworkService.fetchBooks()
        XCTAssertNotNil(bookListDataModel)
    }
    
    func testFetchBooksFailure() async throws {
        mockNetworkService.mockError = ErrorResponse.invalidData

        do {
            let _ = try await bookNetworkService.fetchBooks()
            XCTFail("Success not expected")
        }
        catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
