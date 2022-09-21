//
//  NonReservedSheetView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/20.
//

import SwiftUI

struct NonReservedSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Image("nonreserved")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.width/1.7, alignment: .center)
            Button(action: {
                dismiss()
            }) {
                Text("戻る")
                    .frame(width: 200, height: 40, alignment: .center)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.yellow, lineWidth: 2))
            }
        }
    }
}

struct NonReservedSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NonReservedSheetView().previewInterfaceOrientation(.landscapeRight)
    }
}
