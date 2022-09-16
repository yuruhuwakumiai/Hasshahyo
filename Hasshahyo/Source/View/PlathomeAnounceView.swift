//
//  PlathomeAnounceView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/16.
//

import SwiftUI

struct PlathomeAnounceView: View {
    var body: some View {
        ElevatorView()
    }
}

struct ElevatorView: View {
    var body: some View {
        Text("①　後方のエスカレーター、エレベーターから在来線コンコースへ")
        Image("zairai")
    }
}

struct PlathomeAnounceView_Previews: PreviewProvider {
    static var previews: some View {
        PlathomeAnounceView()
    }
}
