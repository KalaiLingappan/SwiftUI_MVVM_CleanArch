//
//  BookDomainDTO.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 19/01/24.
//

struct BookDomainDTO: Decodable {
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

extension BookDomainDTO {
    func book() -> Book {
        Book(bookID: bookID,
             title: title,
             subtitle: subtitle,
             description: description,
             pageCount: pageCount,
             imageLink: imageLink,
             publisher: publisher,
             publishedDate: publishedDate,
             language: language,
             contentVersion: contentVersion,
             authors: authors,
             categories: categories)
    }
}
