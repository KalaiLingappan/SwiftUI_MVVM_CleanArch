//
//  AppDIRegistry.swift.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

import NetworkManager

final class AppDIRegistry {
    var networkService: NetworkService {
        DataNetworkService(urlSession: SecureURLSession.shared)
    }
    
    lazy var bookListView: BooksListDashboardView = {
        let bookListFactory = BooksListFactory(networkService: networkService)
        return bookListFactory.makeBookListView()
    }()
}
