//
//  AmenitiesView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 05/01/24.
//

import SwiftUI

struct AmenitiesView: View {
    let amenities: String
    
    var body: some View {
        Text("Amenities")
            .fontWeight(.bold)
        Text(amenities)
            .fontWeight(.light)
    }
}
