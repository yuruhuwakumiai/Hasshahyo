//
//  ShinkansenSheetGuideView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/19.
//

import SwiftUI

struct ShinkansenSheetGuideView: View {
    @State var isShowReservedSheetView = false
    @State var isShowNonReservedSheetView = false

    var body: some View {
        VStack {
            SheetSelectButton(buttonAction: reservedButtonAction, text: "指定席")
                .fullScreenCover(isPresented: $isShowReservedSheetView) {
                    ReservedSheetView()
                }
            SheetSelectButton(buttonAction: nonReservedButtonAction, text: "自由席")
                .fullScreenCover(isPresented: $isShowNonReservedSheetView) {
                    NonReservedSheetView()
                }

        }
    }
    func reservedButtonAction() { isShowReservedSheetView = true }
    func nonReservedButtonAction() { isShowNonReservedSheetView = true }
}

struct SheetSelectButton: View {
    let buttonAction: () -> Void
    let text: String
    
    var body: some View {
        Button(action: {
            buttonAction()
        }) {
            Text(text)
                .frame(width: 200, height: 40, alignment: .center)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.yellow, lineWidth: 2)
                )
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

