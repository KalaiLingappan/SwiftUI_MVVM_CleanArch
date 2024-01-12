//
//  PropertyInteractor.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 10/01/24.
//

import NetworkManager

protocol PropertyUseCaseProtocol {
    func fetchProperties() async throws -> [Property]
}

class PropertyUseCase: PropertyUseCaseProtocol {
    private var networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchProperties() async throws -> [Property] {
        do {
            let propertiesList = try await networkService.fetchDataFor(request: ListDataRequest())
            return propertiesList?.results ?? []
        } catch {
            throw error
        }
    }
}
