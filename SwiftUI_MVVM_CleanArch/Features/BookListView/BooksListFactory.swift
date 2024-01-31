//
//  BooksListFactory.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

import NetworkManager

final class BooksListFactory {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    private func makeBookNetworkService() -> BookNetworkService {
        BookNetworkServiceImpl(networkService: networkService)
    }
    
    private func makeBookRepository() -> BookRepository {
        BookRepositoryImpl(bookNetworkService: makeBookNetworkService())
    }
    
    private func makeBookUseCase() -> FetchBooksUseCase {
        FetchBooksUseCaseImpl(bookRepository: makeBookRepository())
    }
    
    private func makeBookViewModel() -> BookListViewModel {
        BookListViewModel(fetchBooksUseCase: makeBookUseCase())
    }
    
    func makeBookListView() -> BooksListDashboardView {
        BooksListDashboardView(listViewModel: makeBookViewModel())
    }
}
