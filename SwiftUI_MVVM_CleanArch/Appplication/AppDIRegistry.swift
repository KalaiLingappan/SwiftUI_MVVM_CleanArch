//
//  AppDIRegistry.swift.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

import NetworkManager

class AppDIRegistry {
    var networkService: NetworkService {
        DataNetworkService()
    }
    
    lazy var bookListView: BooksListDashboardView = {
        let bookListFactory = BooksListFactory(networkService: networkService)
        return bookListFactory.makeBookListView()
    }()
}
