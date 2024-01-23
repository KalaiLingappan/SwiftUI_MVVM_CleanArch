//
//  AsyncImageView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 05/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct AsyncImageView: View {
    let url: URL?
    
    var body: some View {
        if let imageURL = url {
            WebImage(url: imageURL)
                .resizable()
                .placeholder(Image(systemName: AppConstants.placeholderImageName))
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
        } else {
            Image(systemName: AppConstants.placeholderImageName)
                .resizable()
                .scaledToFit()
        }
    }
}

