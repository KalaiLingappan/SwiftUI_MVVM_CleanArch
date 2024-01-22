//
//  MockData.swift
//  SwiftUI_MVVM_CleanArchTests
//
//  Created by Kalaiprabha L on 20/01/24.
//

import Foundation

@testable import SwiftUI_MVVM_CleanArch

final class MockData {
    
    static var bookDataDTO: [BookDataDTO] {
        bookListDataModel.items
    }
    
    static var bookDomainDTO: [BookDomainDTO] {
        return bookDataDTO.map { $0.domainDTO() }
    }
    
    static var bookList: [Book] {
        return bookDomainDTO.map { $0.book() }
    }
    
    static var bookListDataModel: BookListDataModel {
        try! JSONDecoder().decode(BookListDataModel.self, from: booksData)
    }
    
    static var booksData: Data {
        loadJsonData("Mock")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
