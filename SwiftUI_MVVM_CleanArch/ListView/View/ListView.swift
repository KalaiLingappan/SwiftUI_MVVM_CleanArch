//
//  ListView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 03/01/24.
//

import SwiftUI
import NetworkManager

struct ListView: View {
    @StateObject var listViewModel: ListViewModel
    
    init() {
        let dataNetworkService = DataNetworkService()
        let propertyUseCase = PropertyUseCase(networkService: dataNetworkService)
        _listViewModel = StateObject(wrappedValue: ListViewModel(propertyUseCase: propertyUseCase))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !listViewModel.errorMessage.isEmpty {
                    ErrorView(errorMessage: listViewModel.errorMessage)
                }
                else {
                    SuccessView(title: listViewModel.title, propertiesList: listViewModel.propertiesList)
                }
            }
            .task {
                await listViewModel.fetchData()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
