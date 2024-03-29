//
//  Text-Extension.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/09/02.
//

import Foundation
import SwiftUI

extension Text {
    func h1Text(_ foregroundColor: Color) -> Text {
        self
            .foregroundColor(foregroundColor)
            .font(.mainFont(size: 48))
            .fontWeight(.heavy)
    }

    func h2Text(_ foregroundColor: Color) -> Text {
        self
            .foregroundColor(foregroundColor)
            .font(.mainFont(size: 28))
            .fontWeight(.heavy)
    }

    func h3Text(_ foregroundColor: Color) -> Text {
        self
            .foregroundColor(foregroundColor)
            .font(.mainFont(size: 25))
            .fontWeight(.heavy)
    }

}
