//
//  Book.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

import Foundation

struct Book {
    let bookID: String
    let title: String
    let subtitle: String?
    let description: String?
    let pageCount: Int?
    let imageLink: String?
    let publisher: String?
    let publishedDate: String?
    let language: String?
    let contentVersion: String?
    let authors: [String]?
    let categories: [String]?
}

extension Book {
    var imageURL: URL? {
        if let urlString = imageLink, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
}
