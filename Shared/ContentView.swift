//
//  ContentView.swift
//  Shared
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        // ẩn tab bar
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Global Data
var rect = UIScreen.main.bounds
var edge = UIApplication.shared.windows.first?.safeAreaInsets
