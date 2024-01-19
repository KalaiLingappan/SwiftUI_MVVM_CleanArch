//
//  ListDataModel.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 03/01/24.
//

import Foundation

struct ListDataModel: Decodable {
    let totalItems: Int
    let items: [BookDataDTO]
}
