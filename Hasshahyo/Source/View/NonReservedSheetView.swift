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
        Image("nonreserved")
        Button(action: {
            dismiss()
        }) {
            Text("戻る")
        }

    }
}

struct NonReservedSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NonReservedSheetView()
    }
}
