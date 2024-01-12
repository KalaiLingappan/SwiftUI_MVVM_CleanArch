//
//  AddressView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 05/01/24.
//

import SwiftUI

struct AddressView: View {
    let address: String
    
    var body: some View {
        Text("Address")
            .fontWeight(.bold)
        Text(address)
            .italic()
    }
}
