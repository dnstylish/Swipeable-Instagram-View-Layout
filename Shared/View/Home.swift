//
//  Home.swift
//  Swipeable Instagram View Layout (iOS)
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab: String = "house.fill"
    
    // To update Dark Mode
    @Environment(\.colorScheme) var schema
    
    @Binding var offset: CGFloat
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            FeedView(offset: $offset)
                .tag("house.fill")
            
            Text("Search")
                .tag("magnifyingglass")
            
            Text("Reels")
                .tag("airplayvideo")
            
            Text("Liked")
                .tag("suit.heart.fill")
            
            Text("Account")
                .tag("suit.heart.fill")
            
        }
        .overlay(
            // Custom tabbar
            VStack(spacing: 12) {
                
                Divider()
                    .padding(.horizontal, -15)
                
                HStack(spacing: 0) {
                    
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "magnifyingglass", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "airplayvideo", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "suit.heart.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "person.circle", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom, edge?.bottom ?? 15)
            .background(schema == .dark ? Color.black : Color.white)
            ,alignment: .bottom
        )
        .ignoresSafeArea()
        
    }
}

// Tab Bar Button
struct TabBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: { selectedTab = image }) {
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(image == selectedTab ? .primary : .gray)
            
        }
        
    }
    
}
