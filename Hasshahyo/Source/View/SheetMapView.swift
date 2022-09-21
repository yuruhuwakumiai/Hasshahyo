//
//  SheetMapView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/21.
//

import SwiftUI

struct SheetMapView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            WebView()
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
            .padding(.bottom, 15)
        }
    }
}

struct SheetMapView_Previews: PreviewProvider {
    static var previews: some View {
        SheetMapView()
    }
}
