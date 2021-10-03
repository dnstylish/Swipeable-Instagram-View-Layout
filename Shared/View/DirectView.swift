//
//  DirectView.swift
//  Swipeable Instagram View Layout (iOS)
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct DirectView: View {
    
    @Binding var offset: CGFloat
    @State var search: String = ""
    
    var body: some View {
        VStack {
            
            HStack(spacing: 15) {
                
                Button(action: { offset = rect.width }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Direct")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                
                Button(action: {}) {
                    Image(systemName: "video")
                        .font(.title)
                }
                
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
                
                
            }
            .foregroundColor(.primary)
            .padding()
            
            ScrollView {
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search...", text: $search)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.primary.opacity(0.06))
                    .cornerRadius(12)
                    
                    
                    ForEach(posts) { post in
                        
                        
                        HStack(spacing: 15) {
                            Image(post.profile)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                            
                            Text(post.user)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "camera")
                                    .font(.title)
                            }
                            .foregroundColor(.gray)
                        }
                        .padding(.top, 8)
                        
                    }
                }
                .padding()
            }
                        
        }
        .frame(maxWidth: .infinity)
        .padding(.top, edge?.top ?? 15)
        .padding(.bottom, edge?.bottom ?? 15)
    }
}

struct DirectView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
