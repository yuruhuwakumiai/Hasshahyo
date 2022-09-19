//
//  PlathomeAnounceView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/16.
//

import SwiftUI

struct PlathomeAnounceView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()
            GuidanceView(guidText: "①　エスカレーター、エレベータから\n在来線駅舎へ", guidImage: "zairai")
            Spacer()
            GuidanceView(guidText: "②　在来線改札口へ", guidImage: "kaisatu")
            Spacer()
            Button(action: {
                didTapDismissButton()
            }) {
                Text("戻る")
                    .frame(width: 160, height: 40, alignment: .center)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.yellow, lineWidth: 2)
                    )
            }
            Spacer()
        }
    }

    private func didTapDismissButton() {
        presentationMode.wrappedValue.dismiss()
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
                .multilineTextAlignment(.center)
            Image(guidImage)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2.6)
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
