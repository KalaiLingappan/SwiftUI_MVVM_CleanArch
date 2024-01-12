//
//  ListViewModel.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 04/01/24.
//

import Foundation
import NetworkManager

class ListViewModel: ObservableObject {
    @Published var propertiesList: [Property] = []
    @Published var errorMessage: String = ""
    private var propertyUseCase: PropertyUseCaseProtocol
    
    init(propertyUseCase: PropertyUseCaseProtocol) {
        self.propertyUseCase = propertyUseCase
    }
    
    @MainActor
    func fetchData() async {
        do {
            self.propertiesList = try await propertyUseCase.fetchProperties()
        }
        catch {
            errorMessage = error.localizedDescription
        }
    }
    
    var title: String {
        AppConstants.listViewTitle
    }
}
