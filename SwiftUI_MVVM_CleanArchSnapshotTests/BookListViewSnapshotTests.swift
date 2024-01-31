//
//  BookListViewSnapshotTests.swift
//  SwiftUI_MVVM_CleanArchUITests
//
//  Created by Kalaiprabha L on 22/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
import NetworkManager

@testable import SwiftUI_MVVM_CleanArch

final class BookListViewSnapshotTests: XCTestCase {
    var mockFetchBookUseCase: MockFetchBooksUseCase!
    var viewModel: BookListViewModel!
    
    override func setUp() {
        super.setUp()
        
        mockFetchBookUseCase = MockFetchBooksUseCase()
        viewModel = BookListViewModel(fetchBooksUseCase: mockFetchBookUseCase)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockFetchBookUseCase = nil
        viewModel = nil
    }
    
    func testSuccessAppearance() {
        viewModel.booksList = MockData.bookList
        
        let contentView = BooksListDashboardView(listViewModel: viewModel)
        let viewController = contentView.toViewController()
        viewController.performSnapshotTests(named: "BookListView_Success")
    }
    
    func testErrorAppearance() {
        viewModel.errorMessage = "Error while decoding the response"
        
        let contentView = BooksListDashboardView(listViewModel: viewModel)
        let viewController = contentView.toViewController()
        viewController.performSnapshotTests(named: "BookListView_Failure")
    }
}

extension View {
    func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}

extension UIViewController {
    func performSnapshotTests(
            named name: String,
            testName: String = "Snapshot") {
            assertSnapshot(
                matching: self,
                as: .image(),
                named: name,
                testName: testName)
        }
}
