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

// 佐世保線ローカル作成
struct SaseboUpTimeData {

}

struct ContentView: View {

    private let dateFormatter = DateFormatter()
    @State private var dateText = ""
    @State private var nowDate = Date()
    @State private var hakataTimeTableListIndex = 0
    @State private var nagasakiTimetableListIndex = 0
    @State private var isshowPlathomeAnounceView = false

    // 9/12　確認（hashimoto/shirai）
    @State private var hakataTimeTableList:[TimeTable] = [
        TimeTable(id: 0, name: "みどり\n２号",distination: "博多",departure: "6:52", platform: "のりば10"),
        TimeTable(id: 1, name: "リレー\nかもめ\n４号", distination: "博多",departure: "7:31", platform: "のりば10"),
        TimeTable(id: 2, name: "みどり\n６号", distination: "博多",departure: "7:58", platform: "のりば2"),
        TimeTable(id: 3, name: "リレー\nかもめ\n８号", distination: "博多",departure: "8:19", platform: "のりば10"),
        TimeTable(id: 4, name: "みどり\n１０号", distination: "博多",departure: "8:53", platform: "のりば 2"),
        TimeTable(id: 5, name: "リレー\nかもめ\n１２号", distination: "博多",departure: "9:06", platform: "のりば10"),
        TimeTable(id: 6, name: "みどり\n１４号", distination: "博多",departure: "9:51", platform: "のりば10"),
        TimeTable(id: 7, name: "リレー\nかもめ\n１６号", distination: "博多",departure: "10:16", platform: "のりば10"),
        TimeTable(id: 8, name: "みどり\n１８号", distination: "博多",departure: "10:51", platform: "のりば 2"),
        TimeTable(id: 9, name: "リレー\nかもめ２０号", distination: "博多",departure: "11:17", platform: "のりば10"),
        TimeTable(id: 10, name: "みどり\nハウス\nテンボス\n２２号", distination: "博多",departure: "11:29", platform: "のりば 2"),
        TimeTable(id: 11, name: "リレー\nかもめ\n２４号", distination: "博多",departure: "12:16", platform: "のりば10"),
        TimeTable(id: 12, name: "みどり\nハウス\nテンボス\n２６号", distination: "博多",departure: "12:27", platform: "のりば 2"),
        TimeTable(id: 13, name: "リレー\nかもめ\n２８号", distination: "博多",departure: "13:15", platform: "のりば10"),
        TimeTable(id: 14, name: "みどり\nハウス\nテンボス\n３０号", distination: "博多",departure: "13:29", platform: "のりば　2"),
        TimeTable(id: 15, name: "リレー\nかもめ\n３２号", distination: "博多",departure: "14:16", platform: "のりば10"),
        TimeTable(id: 16, name: "みどり\n３４号", distination: "博多",departure: "14:29", platform: "のりば 2"),
        TimeTable(id: 17, name: "リレー\nかもめ\n３６号", distination: "博多",departure: "15:16", platform: "のりば10"),
        TimeTable(id: 18, name: "みどり\nハウス\nテンボス\n３８号", distination: "博多",departure: "15:28", platform: "のりば 2"),
        TimeTable(id: 19, name: "リレー\nかもめ\n４０号", distination: "博多",departure: "16:16", platform: "のりば10"),
        TimeTable(id: 20, name: "みどり\nハウス\nテンボス\n４２号", distination: "博多",departure: "16:42", platform: "のりば 1"),
        TimeTable(id: 21, name: "リレー\nかもめ\n４４号", distination: "博多",departure: "17:13", platform: "のりば10"),
        TimeTable(id: 22, name: "みどり\n４６号", distination: "博多",departure: "17:50", platform: "のりば10"),
        TimeTable(id: 23, name: "リレー\nかもめ\n４８号", distination: "博多",departure: "18:15", platform: "のりば10"),
        TimeTable(id: 24, name: "３６\nぷらす３", distination: "博多",departure: "18:24", platform: "のりば 2"),
        TimeTable(id: 25, name: "みどり\n５０号", distination: "博多",departure: "18:48", platform: "のりば10"),
        TimeTable(id: 26, name: "リレー\nかもめ\n５２号", distination: "博多",departure: "19:15", platform: "のりば10"),
        TimeTable(id: 27, name: "みどり\n５４号", distination: "博多",departure: "19:51", platform: "のりば10"),
        TimeTable(id: 28, name: "リレー\nかもめ\n５６号", distination: "博多",departure: "20:18", platform: "のりば10"),
        TimeTable(id: 29, name: "みどり\n５８号", distination: "博多",departure: "20:57", platform: "のりば10"),
        TimeTable(id: 30, name: "みどり\n６０号", distination: "博多",departure: "21:31", platform: "のりば10"),
        TimeTable(id: 31, name: "リレー\nかもめ\n６２号", distination: "博多",departure: "21:49", platform: "のりば10"),
        TimeTable(id: 32, name: "リレー\nかもめ\n６４号", distination: "門司港",departure: "22:43", platform: "のりば10"),
    ]

// 9/12　確認（hashimoto/shirai）
    @State private var nagasakiTimeTableList:[TimeTable] = [
        TimeTable(id: 0, name: "かもめ\n１号",distination: "長崎",departure: "7:03", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n３号", distination: "長崎",departure: "7:43", platform: "のりば11"),
        TimeTable(id: 2, name: "かもめ\n５号", distination: "長崎",departure: "8:29", platform: "のりば11"),
        TimeTable(id: 3, name: "かもめ\n９号", distination: "長崎",departure: "9:19", platform: "のりば11"),
        TimeTable(id: 4, name: "かもめ\n１３号", distination: "長崎",departure: "10:00", platform: "のりば11"),
        TimeTable(id: 5, name: "かもめ\n１７号", distination: "長崎",departure: "11:01", platform: "のりば11"),
        TimeTable(id: 6, name: "かもめ\n２１号", distination: "長崎",departure: "11:58", platform: "のりば11"),
        TimeTable(id: 7, name: "かもめ\n２５号", distination: "長崎",departure: "12:56", platform: "のりば11"),
        TimeTable(id: 8, name: "かもめ\n２９号", distination: "長崎",departure: "13:58", platform: "のりば11"),
        TimeTable(id: 9, name: "かもめ\n３３号", distination: "長崎",departure: "14:56", platform: "のりば11"),
        TimeTable(id: 10, name: "かもめ\n３７号", distination: "長崎",departure: "15:57", platform: "のりば11"),
        TimeTable(id: 11, name: "かもめ\n４１号", distination: "長崎",departure: "16:58", platform: "のりば11"),
        TimeTable(id: 12, name: "かもめ\n４３号", distination: "長崎",departure: "17:24", platform: "のりば11"),
        TimeTable(id: 13, name: "かもめ\n４５号", distination: "長崎",departure: "18:00", platform: "のりば11"),
        TimeTable(id: 14, name: "かもめ\n４７号", distination: "長崎",departure: "18:25", platform: "のりば11"),
        TimeTable(id: 15, name: "かもめ\n４９号", distination: "長崎",departure: "18:59", platform: "のりば11"),
        TimeTable(id: 16, name: "かもめ\n５１号", distination: "長崎",departure: "19:25", platform: "のりば11"),
        TimeTable(id: 17, name: "かもめ\n５３号", distination: "長崎",departure: "20:02", platform: "のりば11"),
        TimeTable(id: 18, name: "かもめ\n５５号", distination: "長崎",departure: "20:30", platform: "のりば11"),
        TimeTable(id: 19, name: "かもめ\n５７号", distination: "長崎",departure: "21:06", platform: "のりば11"),
        TimeTable(id: 20, name: "かもめ\n６１号", distination: "長崎",departure: "22:02", platform: "のりば11"),
        TimeTable(id: 21, name: "かもめ\n６５号", distination: "長崎",departure: "23:12", platform: "のりば11")
    ]

    var body: some View {
        HStack {
            VStack {
                MainTextView(text: "佐世保線")
                MainTextView(text: "SaseboLine")
                MainTextView(text: "博多方面")
                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
                List(hakataTimeTableListIndex..<hakataTimeTableList.count, id: \.self) { index in
                    HStack {
                        Text(hakataTimeTableList[index].name)
                            .h3Text(Color("train_red"))
                        Spacer()
                        Text(hakataTimeTableList[index].distination)
                            .h1Text(Color("distination_orange"))
                        Spacer()
                        Text(hakataTimeTableList[index].departure)
                            .h1Text(Color("time_green"))
                        Spacer()
                        Text(hakataTimeTableList[index].platform)
                            .h3Text(Color("distination_orange"))
                    }
                    .listRowBackground(Color.black)
                    .frame(height : 200)
                }
                HStack {
                    Button(action: {
                        isshowPlathomeAnounceView = true

                    }) {
                        Text("在来線のりば案内")
                            .frame(width: 160, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )

                    }
                    .fullScreenCover (isPresented: $isshowPlathomeAnounceView) {
                        PlathomeAnounceView()
                    }
                    Button(action: {

                    }) {
                        Text("特急列車座席表")
                            .frame(width: 160, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )
                    }
                }
                .padding(100)
            }
            .background(Color("main_blue"))
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                /// initは使わない
                dateFormatter.dateFormat = "HH:mm"
                let dateFormatterHH = DateFormatter()
                let dateFormattermm = DateFormatter()
                dateFormatterHH.dateFormat = "HH"
                dateFormattermm.dateFormat = "mm"
                dateFormatterHH.locale = Locale(identifier: "ja_jp")
                dateFormattermm.locale = Locale(identifier: "ja_jp")
                dateFormatter.locale = Locale(identifier: "ja_jp")
                /// .onAppearは一つにまとめる。
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.nowDate = Date()
                    dateText = "\(dateFormatter.string(from: nowDate))"
                    let hh = Int(dateFormatterHH.string(from: nowDate))!*60
                    let mm = Int(dateFormattermm.string(from: nowDate))!
                    let minute = hh + mm

                    switch minute {
                    case HakataExpressTimeData.midori_two:
                        hakataTimeTableListIndex = 0

                    case HakataExpressTimeData.relayKamome_four:
                        hakataTimeTableListIndex = 1

                    case HakataExpressTimeData.midori_six:
                        hakataTimeTableListIndex = 2

                    case HakataExpressTimeData.relaykamome_eight:
                        hakataTimeTableListIndex = 3

                    case HakataExpressTimeData.midori_ten:
                        hakataTimeTableListIndex = 4

                    case HakataExpressTimeData.relaykamome_twelve:
                        hakataTimeTableListIndex = 5

                    case HakataExpressTimeData.midori_fourteen:
                        hakataTimeTableListIndex = 6

                    case HakataExpressTimeData.relaykamome_sixteen:
                        hakataTimeTableListIndex = 7

                    case HakataExpressTimeData.midori_eighteen:
                        hakataTimeTableListIndex = 8

                    case HakataExpressTimeData.relaykamome_twenty:
                        hakataTimeTableListIndex = 9

                    case HakataExpressTimeData.midori_HTB_twentytwo:
                        hakataTimeTableListIndex = 10

                    case HakataExpressTimeData.relaykamome_twentyfour:
                        hakataTimeTableListIndex = 11

                    case HakataExpressTimeData.midori_HTB_twentysix:
                        hakataTimeTableListIndex = 12

                    case HakataExpressTimeData.relaykamome_twentyeight:
                        hakataTimeTableListIndex = 13

                    case HakataExpressTimeData.midori_HTB_thirty:
                        hakataTimeTableListIndex = 14

                    case HakataExpressTimeData.relaykamome_thirtytwo:
                        hakataTimeTableListIndex = 15

                    case HakataExpressTimeData.midori_thirtyfour:
                        hakataTimeTableListIndex = 16

                    case HakataExpressTimeData.relaykamome_thirtysix:
                        hakataTimeTableListIndex = 17

                    case HakataExpressTimeData.midori_HTB_thirtyeight:
                        hakataTimeTableListIndex = 18

                    case HakataExpressTimeData.relaykamome_forty:
                        hakataTimeTableListIndex = 19

                    case HakataExpressTimeData.midori_HTB_fortytwo:
                        hakataTimeTableListIndex = 20

                    case HakataExpressTimeData.relaykamome_fortyfour:
                        hakataTimeTableListIndex = 21

                    case HakataExpressTimeData.midori_fortysix:
                        hakataTimeTableListIndex = 22

                    case HakataExpressTimeData.relaykamome_fortyeight:
                        hakataTimeTableListIndex = 23

                    case HakataExpressTimeData.sanjuuroku:
                        hakataTimeTableListIndex = 24

                    case HakataExpressTimeData.midori_fifty:
                        hakataTimeTableListIndex = 25

                    case HakataExpressTimeData.relaykamome_fiftytwo:
                        hakataTimeTableListIndex = 26

                    case HakataExpressTimeData.midori_fiftyfour:
                        hakataTimeTableListIndex = 27

                    case HakataExpressTimeData.relaykamome_fiftysix:
                        hakataTimeTableListIndex = 28

                    case HakataExpressTimeData.midori_fiftyeight:
                        hakataTimeTableListIndex = 29

                    case HakataExpressTimeData.midori_sixty:
                        hakataTimeTableListIndex = 30

                    case HakataExpressTimeData.relaykamome_sixtytwo:
                        hakataTimeTableListIndex = 31

                    case HakataExpressTimeData.relaykamome_sixtyfour:
                        hakataTimeTableListIndex = 32
                    default:
                        break
                    }
                }
            }

            VStack {
                MainTextView(text: "西九州新幹線")
                MainTextView(text: "NishiKyushuShinkansen")
                MainTextView(text: "長崎方面")
                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
                List(nagasakiTimetableListIndex..<nagasakiTimeTableList.count, id: \.self) { index in
                    HStack {
                        Text(nagasakiTimeTableList[index].name)
                            .h3Text(Color("train_red"))
                        Spacer()
                        Text(nagasakiTimeTableList[index].distination)
                            .h1Text(Color("distination_orange"))
                        Spacer()
                        Text(nagasakiTimeTableList[index].departure)
                            .h1Text(Color("time_green"))
                        Spacer()
                        Text(nagasakiTimeTableList[index].platform)
                            .h3Text(Color("distination_orange"))
                    }
                    .listRowBackground(Color.black)
                    .frame(height : 200)
                }
                HStack {
                    Button(action: {

                    }) {
                        Text("")
                            .foregroundColor(.white)
                    }

                    Button(action: {

                    }) {
                        Text("新幹線座席表")
                            .frame(width: 160, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )
                    }
                }
                .padding(100)
            }
            .background(Color("main_blue"))
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                dateFormatter.dateFormat = "HH:mm"
                let dateFormatterHH = DateFormatter()
                let dateFormattermm = DateFormatter()
                dateFormatterHH.dateFormat = "HH"
                dateFormattermm.dateFormat = "mm"
                dateFormatterHH.locale = Locale(identifier: "ja_jp")
                dateFormattermm.locale = Locale(identifier: "ja_jp")
                dateFormatter.locale = Locale(identifier: "ja_jp")
                /// .onAppearは一つにまとめる。
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.nowDate = Date()
                    dateText = "\(dateFormatter.string(from: nowDate))"
                    let hh = Int(dateFormatterHH.string(from: nowDate))!*60
                    let mm = Int(dateFormattermm.string(from: nowDate))!
                    let minute = hh + mm

                    switch minute {
                    case NagasakiShinkansenTimeData.kamome_One:
                        nagasakiTimetableListIndex = 0

                    case NagasakiShinkansenTimeData.kamome_three:
                        nagasakiTimetableListIndex = 1

                    case NagasakiShinkansenTimeData.kamome_five:
                        nagasakiTimetableListIndex = 2

                    case NagasakiShinkansenTimeData.kamome_nine:
                        nagasakiTimetableListIndex = 3

                    case NagasakiShinkansenTimeData.kamome_thirteen:
                        nagasakiTimetableListIndex = 4

                    case NagasakiShinkansenTimeData.kamome_seventeen:
                        nagasakiTimetableListIndex = 5

                    case NagasakiShinkansenTimeData.kamome_twenty_one:
                        nagasakiTimetableListIndex = 6

                    case NagasakiShinkansenTimeData.kamome_twenty_five:
                        nagasakiTimetableListIndex = 7

                    case NagasakiShinkansenTimeData.kamome_twenty_nine:
                        nagasakiTimetableListIndex = 8

                    case NagasakiShinkansenTimeData.kamome_thirty_three:
                        nagasakiTimetableListIndex = 9

                    case NagasakiShinkansenTimeData.kamome_thirty_seven:
                        nagasakiTimetableListIndex = 10

                    case NagasakiShinkansenTimeData.kamome_forty_one:
                        nagasakiTimetableListIndex = 11

                    case NagasakiShinkansenTimeData.kamome_forty_three:
                        nagasakiTimetableListIndex = 12

                    case NagasakiShinkansenTimeData.kamome_forty_five:
                        nagasakiTimetableListIndex = 13

                    case NagasakiShinkansenTimeData.kamome_forty_seven:
                        nagasakiTimetableListIndex = 14

                    case NagasakiShinkansenTimeData.kamome_forty_nine:
                        nagasakiTimetableListIndex = 15

                    case NagasakiShinkansenTimeData.kamome_fifty_one:
                        nagasakiTimetableListIndex = 16

                    case NagasakiShinkansenTimeData.kamome_fifty_three:
                        nagasakiTimetableListIndex = 17

                    case NagasakiShinkansenTimeData.kamome_fifty_five:
                        nagasakiTimetableListIndex = 18

                    case NagasakiShinkansenTimeData.kamome_fifty_seven:
                        nagasakiTimetableListIndex = 19

                    case NagasakiShinkansenTimeData.kamome_sixty_one:
                        nagasakiTimetableListIndex = 20

                    case NagasakiShinkansenTimeData.kamome_sixty_five:
                        nagasakiTimetableListIndex = 21
                    default:
                        break
                    }
                }
            }
        }
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
            .previewInterfaceOrientation(.landscapeRight)
    }
}

