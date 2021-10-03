//
//  MainView.swift
//  Swipeable Instagram View Layout (iOS)
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct MainView: View {
    
    @State var offset: CGFloat = rect.width * 2
    
    var body: some View {
        
        GeometryReader { reader in
            
            let frame = reader.frame(in: .global)
            
            ScrollableTabBar(tabs: ["", "", ""], rect: frame, offset: $offset) {
                
                PostView()
                
                Home(offset: $offset)
                
                DirectView(offset: $offset)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
