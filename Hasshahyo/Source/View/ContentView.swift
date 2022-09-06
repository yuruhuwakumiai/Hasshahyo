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
    @State private var timeTableListIndex = 0
    @State private var hakataTimeTableList:[TimeTable] = [
        TimeTable(id: 0, name: "みどり\n２号",distination: "博多",departure: "6:52", platform: "のりば10"),
        TimeTable(id: 1, name: "リレー\nかもめ４号", distination: "博多",departure: "7:31", platform: "のりば 2"),
        TimeTable(id: 2, name: "みどり\n６号", distination: "博多",departure: "7:58", platform: "のりば 2"),
        TimeTable(id: 3, name: "リレー\nかもめ８号", distination: "博多",departure: "8:19", platform: "のりば10"),
        TimeTable(id: 4, name: "みどり\n１０号", distination: "博多",departure: "8:53", platform: "のりば 2"),
        TimeTable(id: 5, name: "リレー\nかもめ１２号", distination: "博多",departure: "9:06", platform: "のりば10"),
        TimeTable(id: 6, name: "みどり\n１４号", distination: "博多",departure: "9:51", platform: "のりば10"),
        TimeTable(id: 7, name: "リレー\nかもめ１６号", distination: "博多",departure: "10:16", platform: "のりば10"),
        TimeTable(id: 8, name: "みどり\n１８号", distination: "博多",departure: "10:51", platform: "のりば 2"),
        TimeTable(id: 9, name: "リレー\nかもめ２０号", distination: "博多",departure: "11:17", platform: "のりば10"),
        TimeTable(id: 10, name: "みどり\nハウステンボス２２号", distination: "博多",departure: "11:29", platform: "のりば 2"),
        TimeTable(id: 11, name: "リレー\nかもめ２４号", distination: "博多",departure: "12:16", platform: "のりば10"),
        TimeTable(id: 12, name: "みどり\nハウステンボス２６号", distination: "博多",departure: "12:27", platform: "のりば　2"),
        TimeTable(id: 13, name: "リレー\nかもめ２８号", distination: "博多",departure: "13:15", platform: "のりば10"),
        TimeTable(id: 14, name: "みどり\nハウステンボス３０号", distination: "博多",departure: "13:29", platform: "のりば　2"),
        TimeTable(id: 15, name: "リレー\nかもめ３２号", distination: "博多",departure: "14:16", platform: "のりば10"),
        TimeTable(id: 16, name: "みどり\nハウステンボス３４号", distination: "博多",departure: "14:29", platform: "のりば10"),
        TimeTable(id: 17, name: "リレー\nかもめ３６号", distination: "博多",departure: "15:16", platform: "のりば10"),
        TimeTable(id: 18, name: "みどり\nハウステンボス３８号", distination: "博多",departure: "15:28", platform: "のりば　2"),
        TimeTable(id: 19, name: "リレー\nかもめ４０号", distination: "博多",departure: "16:16", platform: "のりば10"),
        TimeTable(id: 20, name: "みどり\nハウステンボス４２号", distination: "博多",departure: "16:42", platform: "のりば 1"),
        TimeTable(id: 21, name: "リレー\nかもめ４４号", distination: "博多",departure: "17:13", platform: "のりば10"),
        TimeTable(id: 22, name: "みどり\n４６号", distination: "博多",departure: "17:50", platform: "のりば10"),
        TimeTable(id: 23, name: "リレー\nかもめ４８号", distination: "博多",departure: "18:15", platform: "のりば10"),
        TimeTable(id: 24, name: "３６ぷらす３", distination: "博多",departure: "18:24", platform: "のりば 2"),
        TimeTable(id: 25, name: "みどり\n５０号", distination: "博多",departure: "18:48", platform: "のりば10"),
        TimeTable(id: 26, name: "リレー\nかもめ５２号", distination: "博多",departure: "19:15", platform: "のりば10"),
        TimeTable(id: 27, name: "みどり\n５４号", distination: "博多",departure: "19:51", platform: "のりば10"),
        TimeTable(id: 28, name: "リレー\nかもめ５６号", distination: "博多",departure: "20:18", platform: "のりば10"),
        TimeTable(id: 29, name: "みどり\n５８号", distination: "博多",departure: "20:57", platform: "のりば10"),
        TimeTable(id: 30, name: "みどり\n６０号", distination: "博多",departure: "21:31", platform: "のりば10"),
        TimeTable(id: 31, name: "リレー\nかもめ６２号", distination: "博多",departure: "21:49", platform: "のりば10"),
        TimeTable(id: 32, name: "リレー\nかもめ６４号", distination: "門司港",departure: "22:43", platform: "のりば10"),
    ]

    @State private var nagasakiTimeTableList:[TimeTable] = [
        TimeTable(id: 0, name: "かもめ\n１号",distination: "長崎",departure: "8:00", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n３号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 2, name: "かもめ\n５号", distination: "長崎",departure: "9:00", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n９号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n１３号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n１７号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n２１号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n２５号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n２９号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n３３号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n３７号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n４１号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n４３号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n４５号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n４７号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n４９号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n５１号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n５３号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n５５号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n５７号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n６１号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n６５号", distination: "長崎",departure: "8:30", platform: "のりば11")
    ]

    @State var isOnce1 = true
    @State var isOnce2 = true
    @State var isOnce3 = true
    @State var isOnce4 = true
    @State var isOnce5 = true
    @State var isOnce6 = true
    @State var isOnce7 = true
    @State var isOnce8 = true

    private let dateFormatter = DateFormatter()

    var body: some View {
        HStack {
            VStack {
                MainTextView(text: "佐世保線")
                MainTextView(text: "SaseboLine")
                MainTextView(text: "博多方面")
                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
                List(makeHakataTimeTableArray()) { timeTableList in
                    HStack {
                        Text(timeTableList.name)
                            .h2Text(Color("train_red"))
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

                    }) {
                        Text("送り")
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        hakataResetTimeTable()
                    }) {
                        Text("リセット")
                            .foregroundColor(.white)
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
//                    changeTimeTable()
                }
            }

            VStack {
                MainTextView(text: "西九州新幹線")
                MainTextView(text: "NishiKyushuShinkansen")
                MainTextView(text: "長崎方面")
                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
                List(nagasakiTimeTableList) { timeTableList in
                    HStack {
                        Text(timeTableList.name)
                            .h2Text(Color("train_red"))
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
                        nagasakiNextStepTimeTable()
                    }) {
                        Text("送り")
                    }
                    Button(action: {
                        nagasakiResetTimetable()
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
                    // Listの更新 後からトグルにする これのオンオフで自動手動
//                    changeTimeTable()
                }
            }
        }
    }
    // 簡潔に書きたい
    func changeTimeTable() {
        if dateText == "22:40" && isOnce1 == true {
            hakataTimeTableList.remove(at: 0)
            isOnce1 = false
        }
        if dateText == "21:41" && isOnce2 == true {
            hakataTimeTableList.remove(at: 0)
            isOnce2 = false
        }
        if dateText == "21:42" && isOnce3 == true {
            hakataTimeTableList.remove(at: 0)
            isOnce3 = false
        }
        if dateText == "21:43" && isOnce4 == true {
            hakataTimeTableList.remove(at: 0)
            isOnce4 = false
        }
        if dateText == "21:44" && isOnce5 == true {
            hakataTimeTableList.remove(at: 0)
            isOnce5 = false
        }
        if dateText == "21:45" && isOnce6 == true {
            hakataTimeTableList.remove(at: 0)
            isOnce6 = false
        }
    }

    func hakataNextStepTimeTable() {
        guard hakataTimeTableList.count != 0 else { return }
        hakataTimeTableList.remove(at: 0)
    }

    func nagasakiNextStepTimeTable() {
        guard nagasakiTimeTableList.count != 0 else { return }
        nagasakiTimeTableList.remove(at: 0)
    }

    func hakataResetTimeTable() {
    }

    func nagasakiResetTimetable() {
        //        nagasakiTimeTableList.removeAll()
        //        nagasakiTimeTableList += [
        //            TimeTable(id: 0, name: "かもめ\n２号",distination: "長崎",departure: "8:00", platform: "のりば11"),
        //            TimeTable(id: 1, name: "かもめ\n４号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        //            TimeTable(id: 2, name: "かもめ\n６号", distination: "長崎",departure: "9:00", platform: "のりば11")
        //        ]
    }

    func makeHakataTimeTableArray() -> Array<TimeTable> {

        if dateText <= "13:00" {
            hakataTimeTableList.remove(at: 0)
        }
        if dateText <= "14:00" {
            hakataTimeTableList.removeSubrange(0...1)
        }
        if dateText <= "17:00" {
            hakataTimeTableList.removeSubrange(0...2)
        }

        return hakataTimeTableList
    }

    func makeNagasakiTimeTableArray() -> Array<TimeTable> {
         var nagasakiTimeTableList:[TimeTable] = [
            TimeTable(id: 0, name: "かもめ\n２号",distination: "長崎",departure: "8:00", platform: "のりば11"),
            TimeTable(id: 1, name: "かもめ\n４号", distination: "長崎",departure: "8:30", platform: "のりば11"),
            TimeTable(id: 2, name: "かもめ\n６号", distination: "長崎",departure: "9:00", platform: "のりば11")
        ]

        if dateText <= "12:00" {
            nagasakiTimeTableList.remove(at: 0)
        }
        if dateText <= "12:10" {
            nagasakiTimeTableList.removeSubrange(0...1)
        }
        if dateText <= "16:30" {
            nagasakiTimeTableList.removeSubrange(0...1)
        }
        return nagasakiTimeTableList
    }
}

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
/// Previewsは一番下に記載する
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

