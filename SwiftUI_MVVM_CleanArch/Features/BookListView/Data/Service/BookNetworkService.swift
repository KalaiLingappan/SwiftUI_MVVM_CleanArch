//
//  BookNetworkService.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

import NetworkManager

protocol BookNetworkService {
    func fetchBooks() async throws -> [BookDataDTO]
}

final class BookNetworkServiceImpl: BookNetworkService {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchBooks() async throws -> [BookDataDTO] {
        do {
            let booksList = try await networkService.fetchDataFor(request: ListDataRequest())
            return booksList?.items ?? []
        } catch {
            throw error
        }
    }
}

