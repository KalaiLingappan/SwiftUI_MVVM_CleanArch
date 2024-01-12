//
//  DetailView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 05/01/24.
//

import SwiftUI

struct DetailView: View {
    let property: Property
    @State private var isNavigateToReserve = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImageView(url: property.picture_url?.pictureURL)
                VStack(alignment: .leading, spacing: 10) {
                    Text(property.name)
                        .fontDesign(.serif)
                        .font(.headline)
                    Text("Rating: \(property.review_scores_rating ?? 0)")
                        .foregroundColor(.green)
                    Text(property.description ?? "")
                        .font(.subheadline)
                    AddressView(address: property.address)
                    AmenitiesView(amenities: property.amenitiesString)
                }
                .padding(10)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProperty = Property(id: "123", name: "Sample Property", review_scores_rating: 4, picture_url: Picture(url: "https://via.placeholder.com/150"), description: "test", street: "sddsfds", city: "", state: "", country_code: "",amenities: [])

        DetailView(property: sampleProperty)
    }
}
