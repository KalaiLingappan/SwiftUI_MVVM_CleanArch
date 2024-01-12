//
//  ListDataRequest.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 03/01/24.
//

import NetworkManager

struct ListDataRequest: DataRequest {
    typealias ResponseData = ListDataModel
    var url: String = AppURLs.baseURL + AppURLs.URLEndPoint.list.rawValue
    var method: HTTPMethod = .get
    var headers: [String : String] = [:]
    var queryItems: [String : String] = ["limit": "20"]
}
