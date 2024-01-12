//
//  Property.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 08/01/24.
//

struct Property: Decodable {
    let id: String
    let name: String
    let review_scores_rating: Int?
    let picture_url: Picture?
    let description: String?
    let street: String?
    let city: String?
    let state: String?
    let country_code: String?
    let amenities: [String]?
}

extension Property {
    var address: String {
        "\(street ?? "") , \(city ?? "") , \(state ?? "") , \(country_code ?? "")"
    }
    
    var amenitiesString: String {
        amenities?.joined(separator: "\n") ?? ""
    }
}
