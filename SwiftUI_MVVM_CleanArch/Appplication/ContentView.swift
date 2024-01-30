//
//  ContentView.swift
//  SwiftUI_MVVM_CleanArch
//
//  Created by Kalaiprabha L on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    let appDIRegistry: AppDIRegistry
    
    var body: some View {
        appDIRegistry.bookListView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appDIRegistry: AppDIRegistry())
    }
}

