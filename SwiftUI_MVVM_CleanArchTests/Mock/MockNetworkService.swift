//
//  MockNetworkService.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 22/01/24.
//

import NetworkManager

@testable import SwiftUI_MVVM_CleanArch

class MockNetworkService: NetworkService {
    var mockListDataModel: BookListDataModel?
    var mockError: Error?

    func fetchDataFor<Request: DataRequest>(request: Request) async throws -> Request.ResponseData? {
        if let error = mockError {
            throw error
        }
        return mockListDataModel as? Request.ResponseData
    }
}

