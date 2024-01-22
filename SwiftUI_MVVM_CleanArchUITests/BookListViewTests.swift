//
//  BookListViewTests.swift
//  SwiftUI_MVVM_CleanArchUITests
//
//  Created by Kalaiprabha L on 22/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import SwiftUI_MVVM_CleanArch

final class BookListViewTests: XCTestCase {
    let mockFetchBookUseCase = MockFetchBooksUseCase()
    lazy var viewModel = BookListViewModel(fetchBooksUseCase: mockFetchBookUseCase)
    
    func testDefaultAppearance() {
        viewModel.booksList = MockData.bookList
        
        let contentView = BooksListDashboardView(listViewModel: viewModel)
        let view = UIHostingController(rootView: contentView).view!
        view.frame = UIScreen.main.bounds

        assertSnapshot(matching: view, as: .image)
    }
    
}
