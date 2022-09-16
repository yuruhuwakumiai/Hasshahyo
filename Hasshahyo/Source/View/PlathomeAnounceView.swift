//
//  PlathomeAnounceView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/16.
//

import SwiftUI

struct PlathomeAnounceView: View {
    var body: some View {
        VStack {
            Spacer()
            GuidanceView(guidText: "①　エスカレーター、エレベータから在来線駅舎へ", guidImage: "zairai")
            Spacer()
            GuidanceView(guidText: "②　在来線改札口へ", guidImage: "zairai")
            Spacer()
        }
    }
}

struct GuidanceView: View {
    let guidText: String
    let guidImage: String

    var body: some View {
        VStack {
            Text(guidText)
                .foregroundColor(.black)
                .bold()
                .font(.largeTitle)
            Image(guidImage)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
        }
    }
}
// 横向きプレビュー
struct PlathomeAnounceView_Previews: PreviewProvider {
    static var previews: some View {
        PlathomeAnounceView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
