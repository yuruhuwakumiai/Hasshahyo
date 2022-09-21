//
//  WebView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/21.
//
import SwiftUI
import WebKit //WebKitをインポート

struct WebView: UIViewRepresentable {
    var url: String = "https://1drv.ms/u/s!AvkIKC9_EOn42jPnNvn6UPk0e0QE?e=iPgaj8" //表示するWEBページのURLを指定

    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

struct WebCode_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
