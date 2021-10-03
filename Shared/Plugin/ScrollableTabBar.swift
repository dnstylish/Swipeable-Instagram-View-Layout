//
//  ScrollableTabBar.swift
//  Swipeable Instagram View Layout (iOS)
//
//  Created by Yuan on 03/10/2021.
//

import SwiftUI

struct ScrollableTabBar<Content: View>: UIViewRepresentable {
    
    // store Swiftui
    var content: Content
    
    // ScrollView
    let scrollView: UIScrollView = UIScrollView()
    
    var rect: CGRect
    
    // Content offset
    @Binding var offset: CGFloat
    
    // Tabs
    var tabs: [Any]
    
    init(tabs: [Any] ,rect: CGRect, offset: Binding<CGFloat> ,@ViewBuilder content: ()-> Content) {
        self.rect = rect
        self._offset = offset
        self.tabs = tabs
        self.content = content()
    }
    
    
    func makeCoordinator() -> Coordinator {
        return ScrollableTabBar.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) ->  UIScrollView {
        
        UIBuiler()
        // setting Content Size...
        
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollView.contentOffset.x = offset
        
        scrollView.addSubview(extractView())
        
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // Updating View...
        if uiView.contentOffset.x != offset{
            
            // Animating...
            // The ANimation Glitch Is Because It s Updating On Two Times...

            // Simple....
            // Removing Delegate While Animating...
            
            uiView.delegate = nil
            
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }

        }
    }
    
    
    func UIBuiler() -> Void {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    
    // Extacting Swiftui View
    func extractView() -> UIView {
        
        let controller = UIHostingController(rootView: HStack(spacing: 0) { content }.ignoresSafeArea())
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        return controller.view
        
    }
    
    // Delegate Function To Get Offset...
    
    class Coordinator: NSObject,UIScrollViewDelegate{
        
        var parent: ScrollableTabBar
        
        init(parent: ScrollableTabBar) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            parent.offset = scrollView.contentOffset.x
        }
    }
}
