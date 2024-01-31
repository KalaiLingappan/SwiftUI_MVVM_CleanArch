//
//  BookDetailViewSnapshotTests.swift
//  SwiftUI_MVVM_CleanArchSnapshotTests
//
//  Created by Kalaiprabha L on 31/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import SwiftUI_MVVM_CleanArch

final class BookDetailViewSnapshotTests: XCTestCase {
    let detail = MockData.bookList[0]
    
    func testSuccessAppearance() {
        let contentView = BookDetailView(bookDetail: detail)
        let viewController = contentView.toViewController()
        viewController.performSnapshotTests(named: "BookDetailView")
    }
}
