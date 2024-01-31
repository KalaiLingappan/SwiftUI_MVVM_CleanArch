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
                      imageLink: volumeInfo.imageLinks?.thumbnail,
                      description: volumeInfo.description,
                      publisher: volumeInfo.publisher)
    }
}
