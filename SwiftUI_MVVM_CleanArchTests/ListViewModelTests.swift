//
//  ListViewModelTests.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import XCTest
import NetworkManager

@testable import SwiftUI_MVVM_CleanArch

class ListViewModelTests: XCTestCase {
    let mockPropertyUseCase = MockPropertyUseCase()
    lazy var viewModel = ListViewModel(propertyUseCase: mockPropertyUseCase)
    
    func testFetchData() async throws {
        let properties = [Property(id: "123", name: "Sample Property", review_scores_rating: 4, picture_url: Picture(url: "https://via.placeholder.com/150"), description: "test", street: "sddsfds", city: "", state: "", country_code: "",amenities: [])]
        mockPropertyUseCase.mockProperties = properties
        
        await viewModel.fetchData()
        XCTAssertEqual(properties.count, 1)
    }

    func testFetchDataWithError() async throws {
        mockPropertyUseCase.mockError = ErrorResponse.invalidData

        await viewModel.fetchData()
        XCTAssertEqual(viewModel.errorMessage, ErrorResponse.invalidData.localizedDescription, "Error message should be set")
    }

    // Test the title property
    func testTitle() {
        XCTAssertEqual(viewModel.title, AppConstants.listViewTitle, "Title should match the constant")
    }
}

class MockPropertyUseCase: PropertyUseCaseProtocol {
    var mockProperties: [Property] = []
    var mockError: Error?

    func fetchProperties() async throws -> [Property] {
        if let error = mockError {
            throw error
        }
        return mockProperties
    }
}
