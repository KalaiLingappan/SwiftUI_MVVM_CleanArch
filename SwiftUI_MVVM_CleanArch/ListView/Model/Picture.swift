//
//  Picture.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 08/01/24.
//

import Foundation

struct Picture: Decodable {
    let url: String?
    var pictureURL: URL? {
        if let urlString = url, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
}
