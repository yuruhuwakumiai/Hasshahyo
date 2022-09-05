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
                List(makeNagasakiTimeTableArray()) { timeTableList in
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
    var hakataTimeTableList:[TimeTable] = [
            TimeTable(id: 0, name: "リレー\nかもめ\n２号",distination: "博多",departure: "6:56", platform: "のりば10"),
            TimeTable(id: 1, name: "みどり\n４号", distination: "博多",departure: "7:00", platform: "のりば 2"),
            TimeTable(id: 2, name: "リレー\nかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
            TimeTable(id: 3, name: "リレー\nかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
            TimeTable(id: 4, name: "リレー\nかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
            TimeTable(id: 5, name: "リレー\nかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        ]

        if dateText <= "13:00" {
            hakataTimeTableList.remove(at: 0)
        }
        if dateText <= "14:00" {
            hakataTimeTableList.removeSubrange(0...1)
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
        if dateText <= "12:30" {
//            nagasakiTimeTableList.removeSubrange(0...2)
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

