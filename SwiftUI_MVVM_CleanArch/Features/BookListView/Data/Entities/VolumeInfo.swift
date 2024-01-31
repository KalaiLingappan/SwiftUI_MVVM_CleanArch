//
//  VolumeInfo.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 18/01/24.
//

import Foundation

struct VolumeInfo: Decodable {
    let title: String
    let subtitle: String?
    let imageLinks: BookImage?
    let description: String?
    let publisher: String?
}
