//
//  ErrorView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 11/01/24.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
            Text(errorMessage)
                .font(.headline)
                .fontDesign(.serif)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}