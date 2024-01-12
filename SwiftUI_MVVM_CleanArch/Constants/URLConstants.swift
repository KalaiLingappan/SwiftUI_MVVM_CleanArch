//
//  URLConstants.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 03/01/24.
//

struct AppURLs {
    static let baseURL = "https://public.opendatasoft.com/"
    
    enum URLEndPoint: String {
        case list = "api/explore/v2.1/catalog/datasets/airbnb-listings/records"
        case detailImage = "/150/200"
    }
}
