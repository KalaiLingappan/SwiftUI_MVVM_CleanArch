//
//  BookListViewModelTests.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import XCTest
import NetworkManager

@testable import SwiftUI_MVVM_CleanArch

final class BookListViewModelTests: XCTestCase {
    var mockFetchBookUseCase: MockFetchBooksUseCase!
    var viewModel : BookListViewModel!
    
    override func setUp() {
        super.setUp()
        
        mockFetchBookUseCase = MockFetchBooksUseCase()
        viewModel = BookListViewModel(fetchBooksUseCase: mockFetchBookUseCase)
    }
    
    override func tearDown() {
        super.tearDown()
        mockFetchBookUseCase = nil
        viewModel = nil
    }
    
    func testFetchData() async throws {
        mockFetchBookUseCase.mockBooks = MockData.bookList
        
        await viewModel.fetchData()
        XCTAssertEqual(viewModel.booksList.count, 1)
    }

    func testFetchDataWithError() async throws {
        mockFetchBookUseCase.mockError = ErrorResponse.invalidData

        await viewModel.fetchData()
        XCTAssertEqual(viewModel.errorMessage, ErrorResponse.invalidData.localizedDescription, "Error message should be set")
    }
}
