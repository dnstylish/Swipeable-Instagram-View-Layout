//
//  PostView.swift
//  Swipeable Instagram View Layout (iOS)
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        
        ZStack {
            
            // Camera View
            
            Color.black
            
            VStack {
                
                HStack {
                    Button(action: {}) {
                        
                        Image(systemName: "gear")
                            .font(.title)
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "xmark")
                            .font(.title)
                        
                    }
                }
                .foregroundColor(.white)
                .padding()
                
                Spacer()
                
                Button(action: {}) {
                    
                    Image(systemName: "photo")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                
            }
            .padding(.top, edge?.top ?? 15)
            .padding(.bottom, edge?.bottom)
            
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
