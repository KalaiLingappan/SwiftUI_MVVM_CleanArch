//
//  PropertyUseCaseTests.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import XCTest
import NetworkManager
@testable import SwiftUI_MVVM_CleanArch // Replace with the actual module name

class PropertyUseCaseTests: XCTestCase {
    let mockNetworkService = MockNetworkService()
    
    func testFetchPropertiesSuccess() async throws {
        mockNetworkService.mockListDataModel = ListDataModel(total_count: 1,
                                                           results: [Property(id: "123", name: "Mock Property", review_scores_rating: 4, picture_url: Picture(url: "https://via.placeholder.com/150"), description: "test", street: "sddsfds", city: "", state: "", country_code: "",amenities: [])])

        let propertyUseCase = PropertyUseCase(networkService: mockNetworkService)
        let result = try await propertyUseCase.fetchProperties()
        XCTAssertEqual(result.count, 1, "Expected one property")
        XCTAssertEqual(result[0].name, "Mock Property", "Property name should match")
    }
    
    func testFetchPropertiesNoData() async throws {
        mockNetworkService.mockListDataModel = nil

        let propertyUseCase = PropertyUseCase(networkService: mockNetworkService)
        let result = try await propertyUseCase.fetchProperties()
        XCTAssert(result.isEmpty)
    }

    func testFetchPropertiesFailure() async throws {
        mockNetworkService.mockError = ErrorResponse.invalidData
        let propertyUseCase = PropertyUseCase(networkService: mockNetworkService)

        do {
            _ = try await propertyUseCase.fetchProperties()
        } catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}

// Mock NetworkService for testing
class MockNetworkService: NetworkService {
    var mockListDataModel: ListDataModel?
    var mockError: Error?

    func fetchDataFor<Request: DataRequest>(request: Request) async throws -> Request.ResponseData? {
        if let error = mockError {
            throw error
        }
        return mockListDataModel as? Request.ResponseData
    }
}
