//
//  Background.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/17.
//

import SwiftUI
import Foundation

struct BackgroundView<T: View>: View {
    @ViewBuilder var content: () -> T

    var body: some View {
        Color.gray.edgesIgnoringSafeArea(.all)
            .overlay {
                content()
            }
    }
}

extension List {

    func listBackground(_ color: Color) -> some View {
        UITableView.appearance().backgroundColor = UIColor(color)
        return self
    }
}
