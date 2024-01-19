//
//  ContentView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AppDIRegistry().bookListView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

