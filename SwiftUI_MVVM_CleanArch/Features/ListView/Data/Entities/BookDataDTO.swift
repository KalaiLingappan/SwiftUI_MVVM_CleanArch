//
//  BookDataDTO.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 08/01/24.
//

struct BookDataDTO: Decodable {
    let id: String
    let volumeInfo: VolumeInfo
}

extension BookDataDTO {
    func domainDTO() -> BookDomainDTO {
        BookDomainDTO(bookID: id,
                      title: volumeInfo.title,
                      subtitle: volumeInfo.subtitle,
                      description: volumeInfo.description,
                      pageCount: volumeInfo.pageCount,
                      imageLink: volumeInfo.imageLinks?.thumbnail,
                      publisher: volumeInfo.publisher,
                      publishedDate: volumeInfo.publishedDate,
                      language: volumeInfo.language,
                      contentVersion: volumeInfo.contentVersion,
                      authors: volumeInfo.authors,
                      categories: volumeInfo.categories)
    }
}
