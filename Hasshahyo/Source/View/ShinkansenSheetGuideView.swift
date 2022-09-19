//
//  ShinkansenSheetGuideView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/19.
//

import SwiftUI

struct ShinkansenSheetGuideView: View {

    var body: some View {
        VStack {
            Button(action: {
                print("指定席/自由席切り替え")
            }) {
                Text("指定席/切り替え")
                    .frame(width: 200, height: 40, alignment: .center)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.yellow, lineWidth: 2)
                        )
            }
            Image("nonreserved")
        }
    }
}

// 横向きプレビュー
struct ShinkansenSheetGuideView_Previews: PreviewProvider {
    static var previews: some View {
        ShinkansenSheetGuideView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

