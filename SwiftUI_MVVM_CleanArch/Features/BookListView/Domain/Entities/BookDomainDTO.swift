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
    let imageLink: String?
    let publisher: String?
}

extension BookDomainDTO {
    func book() -> Book {
        Book(bookID: bookID,
             title: title,
             subtitle: subtitle,
             imageLink: imageLink,
             publisher: publisher)
    }
}
