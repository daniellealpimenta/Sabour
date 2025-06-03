//
//  YoutubePlayer.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 26/05/25.
//

import SwiftUI
import WebKit
import Foundation

struct YoutubePlayer: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)?playsinline=1") else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
