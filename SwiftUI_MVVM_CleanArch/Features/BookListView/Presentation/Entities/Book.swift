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
    let imageLink: String?
    let description: String?
    let publisher: String?
}

extension Book {
    var imageURL: URL? {
        if let urlString = imageLink, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
}
