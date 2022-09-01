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
    var departure: String
    var platform: String
}

struct ContentView: View {
    /// @Stateにはprivateをつける
    @State private var dateText = ""
    @State private var nowDate = Date()
    @State var isOnce1 = true
    @State var isOnce2 = true
    @State var isOnce3 = true
    @State var isOnce4 = true
    @State var isOnce5 = true
    @State var isOnce6 = true
    @State var isOnce7 = true
    @State var isOnce8 = true

    private let dateFormatter = DateFormatter()
    /// なるべく、グローバル変数を使わない。できるだけprivateをつける
    @State private var TimeTableList = [
        TimeTable(id: 0, name: "ひかり１号",distination: "新大阪",departure: "6:56", platform: "のりば10"),
        TimeTable(id: 1, name: "ひかり３号", distination: "広島",departure: "7:00", platform: "のりば12"),
        TimeTable(id: 2, name: "のぞみ５号", distination: "新大阪",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 3, name: "のぞみ７号", distination: "岡山",departure: "7:45", platform: "のりば10"),
        TimeTable(id: 4, name: "のぞみ９号", distination: "博多",departure: "7:50", platform: "のりば10"),
        TimeTable(id: 5, name: "のぞみ１１号", distination: "新大阪",departure: "8:00", platform: "のりば10"),
    ]

   @State private var hakataTimeTableList = [
        TimeTable(id: 0, name: "リレーつばめ２号",distination: "博多",departure: "6:56", platform: "のりば10"),
        TimeTable(id: 1, name: "みどり　　　４号", distination: "博多",departure: "7:00", platform: "のりば 2"),
        TimeTable(id: 2, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 3, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 4, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 5, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
    ]

    @State private var nagasakiTimeTableList = [
        TimeTable(id: 0, name: "かもめ２号",distination: "長崎",departure: "8:00", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ４号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 2, name: "かもめ６号", distination: "長崎",departure: "9:00", platform: "のりば11")
    ]

    var body: some View {
        HStack {
            VStack {
                MainTextView(text: "佐世保線")
                MainTextView(text: "SaseboLine")
                MainTextView(text: "博多方面")
                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
                List(TimeTableList) { timeTableList in
                    HStack {
                        Text(timeTableList.name)
                            .h1Text(Color("train_red"))
                        Spacer()
                        Text(timeTableList.distination)
                            .h1Text(Color("distination_orange"))
                        Spacer()
                        Text(timeTableList.departure)
                            .h1Text(Color("time_green"))
                        Spacer()
                        Text(timeTableList.platform)
                            .h2Text(Color("distination_orange"))
                    }
                    .listRowBackground(Color.black)
                    .frame(height : 200)
                }
                HStack {
                    Button(action: {
                        guard TimeTableList.count != 0 else { return }
                        TimeTableList.remove(at: 0)
                    }) {
                        Text("送り")
                    }
                    Button(action: {
                        TimeTableList += [
                            TimeTable(id: 0, name: "ひかり１号",distination: "新大阪",departure: "6:56", platform: "のりば10"),
                            TimeTable(id: 1, name: "ひかり３号", distination: "広島",departure: "7:00", platform: "のりば12"),
                            TimeTable(id: 2, name: "のぞみ５号", distination: "新大阪",departure: "7:30", platform: "のりば10"),
                            TimeTable(id: 3, name: "のぞみ７号", distination: "岡山",departure: "7:45", platform: "のりば10"),
                            TimeTable(id: 4, name: "のぞみ９号", distination: "博多",departure: "7:50", platform: "のりば10"),
                            TimeTable(id: 5, name: "のぞみ１１号", distination: "新大阪",departure: "8:00", platform: "のりば10"),
                        ]

                    }) {
                        Text("リセット")
                    }
                }
                .padding(100)
            }
            .background(Color("main_blue"))
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                /// initは使わない
                dateFormatter.dateFormat = "HH:mm"
                dateFormatter.locale = Locale(identifier: "ja_jp")

                /// .onAppearは一つにまとめる。
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.nowDate = Date()
                    dateText = "\(dateFormatter.string(from: nowDate))"
                    // Listの更新
                    changeTimeTable()
                }
            }

            VStack {
                MainTextView(text: "西九州新幹線")
                MainTextView(text: "NishiKyushuShinkansen")
                MainTextView(text: "長崎方面")
                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
                List(TimeTableList) { timeTableList in
                    HStack {
                        Text(timeTableList.name)
                            .h1Text(Color("train_red"))
                        Spacer()
                        Text(timeTableList.distination)
                            .h1Text(Color("distination_orange"))
                        Spacer()
                        Text(timeTableList.departure)
                            .h1Text(Color("time_green"))
                        Spacer()
                        Text(timeTableList.platform)
                            .h2Text(Color("distination_orange"))
                    }
                    .listRowBackground(Color.black)
                    .frame(height : 200)
                }
                HStack {
                    Button(action: {
                        guard TimeTableList.count != 0 else { return }
                        TimeTableList.remove(at: 0)
                    }) {
                        Text("送り")
                    }
                    Button(action: {
                        TimeTableList += [
                            TimeTable(id: 0, name: "ひかり１号",distination: "新大阪",departure: "6:56", platform: "のりば10"),
                            TimeTable(id: 1, name: "ひかり３号", distination: "広島",departure: "7:00", platform: "のりば12"),
                            TimeTable(id: 2, name: "のぞみ５号", distination: "新大阪",departure: "7:30", platform: "のりば10"),
                            TimeTable(id: 3, name: "のぞみ７号", distination: "岡山",departure: "7:45", platform: "のりば10"),
                            TimeTable(id: 4, name: "のぞみ９号", distination: "博多",departure: "7:50", platform: "のりば10"),
                            TimeTable(id: 5, name: "のぞみ１１号", distination: "新大阪",departure: "8:00", platform: "のりば10"),
                        ]

                    }) {
                        Text("リセット")
                    }
                }
                .padding(100)
            }
            .background(Color("main_blue"))
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                /// initは使わない
                dateFormatter.dateFormat = "HH:mm"
                dateFormatter.locale = Locale(identifier: "ja_jp")

                /// .onAppearは一つにまとめる。
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.nowDate = Date()
                    dateText = "\(dateFormatter.string(from: nowDate))"
                    // Listの更新
                    changeTimeTable()
                }
            }
        }
    }

    // 簡潔に書きたい
    func changeTimeTable() {
        if dateText == "22:40" && isOnce1 == true {
            TimeTableList.remove(at: 0)
            isOnce1 = false
        }
        if dateText == "21:41" && isOnce2 == true {
            TimeTableList.remove(at: 0)
            isOnce2 = false
        }
        if dateText == "21:42" && isOnce3 == true {
            TimeTableList.remove(at: 0)
            isOnce3 = false
        }
        if dateText == "21:43" && isOnce4 == true {
            TimeTableList.remove(at: 0)
            isOnce4 = false
        }
        if dateText == "21:44" && isOnce5 == true {
            TimeTableList.remove(at: 0)
            isOnce5 = false
        }
        if dateText == "21:45" && isOnce6 == true {
            TimeTableList.remove(at: 0)
            isOnce6 = false
        }
    }
}
// MARK: - Modifier
/// これは、Modifierじゃなくて、structでやった方が良いのでは？
//struct MainTextModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .foregroundColor(.white)
//            .font(.largeTitle)
//    }
//}
struct MainTextView: View {
    let text: String
    var isHeavy = true

    var body: some View {
        Text(text)
            .fontWeight(isHeavy ? .heavy : .regular)
            .foregroundColor(.white)
            .font(.largeTitle)
    }
}

/// extensionは別ファイルに記載
/// Previewsは一番下に記載
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

