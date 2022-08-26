//
//  ContentView.swift
//  Hasshahyo
//
//  Created by 橋元雄太郎 on 2022/08/26.
//

import SwiftUI

struct TimeTable: Identifiable {
    var id: Int
    var name: String
    var distination: String
}

struct ContentView: View {

    let timeTableList = [
        TimeTable(id: 0, name: "リレーつばめ２号",distination: "博多"),
        TimeTable(id: 1, name: "みどり４号", distination: "博多"),
        TimeTable(id: 2, name: "リレーかもめ６号", distination: "博多")
    ]

    var body: some View {
        HStack {
            VStack {
                Text("佐世保線")
                Text("SaseboLine")
                Text("博多方面")
                List(timeTableList) { timeTableList in
                    HStack {
                        Text(timeTableList.name)
                        Text(timeTableList.distination)
                    }
                }
            }
            VStack {
                Text("西九州新幹線")
                Text("nishi-kyushushinkansen")
                Text("長崎方面")
                List(timeTableList) { timeTableList in
                    HStack {
                        Text(timeTableList.name)
                        Text(timeTableList.distination)
                    }
                }
            }
        }
        .background(.blue)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
