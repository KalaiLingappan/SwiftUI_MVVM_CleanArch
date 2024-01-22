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
    let mockNetworkService = MockNetworkService()
    lazy var bookNetworkService = BookNetworkServiceImpl(networkService: mockNetworkService)
    
    func testFetchBooksSuccess() async throws {
        mockNetworkService.mockListDataModel = MockData.bookListDataModel

        let bookListDataModel = try await bookNetworkService.fetchBooks()
        XCTAssertNotNil(bookListDataModel)
    }
    
    func testFetchBooksFailure() async throws {
        mockNetworkService.mockError = ErrorResponse.invalidData

        do {
            let bookListDataModel = try await bookNetworkService.fetchBooks()
            XCTFail("Success not expected")
        }
        catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
