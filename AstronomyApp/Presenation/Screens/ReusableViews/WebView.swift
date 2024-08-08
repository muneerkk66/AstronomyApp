//
//  WebView.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import SwiftUI
import WebKit

struct WebContentView: View {
    let url: String
    var body: some View {
        GeometryReader { geometry in
            WebView(url: url)
                .cornerRadius(20)
                .frame(height: geometry.size.height)

        }.padding(20)
    }
}

#Preview {
    WebContentView(url: "")
}

struct WebView: UIViewRepresentable {
    let url: String
    let webView: WKWebView

    init(url: String) {
        webView = WKWebView(frame: .zero)
        self.url = url
    }

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: url)!))
    }
}
