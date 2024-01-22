//
//  FetchBooksUseCaseImplTests.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import XCTest
import NetworkManager
@testable import SwiftUI_MVVM_CleanArch

final class FetchBooksUseCaseImplTests: XCTestCase {
    let mockBookRepository = MockBookRepository()
    lazy var bookUseCase = FetchBooksUseCaseImpl(bookRepository: mockBookRepository)
    
    func testFetchBookSuccess() async throws {
        mockBookRepository.mockBookDomainDTO = MockData.bookDomainDTO

        let result = try await bookUseCase.execute()
        XCTAssertEqual(result.count, 1, "Expected one book")
    }
    
    func testFetchBookNoData() async throws {
        mockBookRepository.mockBookDomainDTO = []

        let result = try await bookUseCase.execute()
        XCTAssert(result.isEmpty)
    }

    func testFetchBookFailure() async throws {
        mockBookRepository.mockError = ErrorResponse.invalidData

        do {
            _ = try await bookUseCase.execute()
            XCTFail("Success not expected")
        } catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
