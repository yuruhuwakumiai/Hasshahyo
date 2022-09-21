//
//  ReservedSheetView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/20.
//

import SwiftUI

struct ReservedSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Image("reserved")
        Button(action: {
            dismiss()
        }) {
            Text("戻る")
        }
    }
}

struct ReservedSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ReservedSheetView()
    }
}
