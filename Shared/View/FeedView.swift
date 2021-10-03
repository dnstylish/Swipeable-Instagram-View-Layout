//
//  FeedView.swift
//  Swipeable Instagram View Layout (iOS)
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct FeedView: View {
    
    @Binding var offset: CGFloat
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {}) {
                    
                    Image(systemName: "plus.app")
                        .font(.title)
                        .foregroundColor(.primary)
                    
                }
                
                Spacer()
                
                Button(action: { offset = rect.width * 2 }) {
                    
                    Image(systemName: "paperplane")
                        .font(.title)
                        .foregroundColor(.primary)
                    
                }
                
            }
            .padding()
            .overlay(
                Text("Instagram")
                    .font(.title2)
                    .fontWeight(.bold)
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 15) {
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image("logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                        }
                            .overlay(
                                
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(x: 8, y: 5)
                                
                                
                                ,alignment: .bottomTrailing
                            
                        )
                    }
                    .padding()
                    
                }
                
                Divider()
                    .padding(.horizontal, -15)
                
                VStack(spacing: 15) {
                    
                    // Posts
                    ForEach(posts) { post in
                        
                        //Post View
                        PostCardView(post: post)
                        
                    }
                }
                .padding(.bottom, 65)
                
            }
            
        }
        
    }
}

struct PostCardView: View {
    
    var post: Post
    @State var comment: String = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            HStack {
                
                Image(post.profile)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text(post.user)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.primary)
                }
            }
            
            Image(post.postImage)
                .resizable()
                .scaledToFill()
                .frame(width: rect.width - 30, height: 300)
                .cornerRadius(15)
            
            HStack(spacing: 15) {
                
                Button(action: {}) {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 25))
                }
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .font(.system(size: 25))
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 25))
                }
                
            }
            .foregroundColor(.primary)
            
            (
                Text("\(post.user) ")
                    .fontWeight(.bold)
                +
                    Text(post.postTitle)
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(6)
            
            
            HStack(spacing: 15) {
                
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                TextField("Add Comment", text: $comment)
                
            }
            
            Text(post.time)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(6)
            
        }
        .padding()
        
    }
    
}
