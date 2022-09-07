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

    @State private var hakataTwoHomeTimeTableList:[TimeTable] = [
        TimeTable(id: 2, name: "みどり\n６号", distination: "博多",departure: "7:58", platform: "のりば 2"),
        TimeTable(id: 4, name: "みどり\n１０号", distination: "博多",departure: "8:53", platform: "のりば 2"),
        TimeTable(id: 8, name: "みどり\n１８号", distination: "博多",departure: "10:51", platform: "のりば 2"),
        TimeTable(id: 10, name: "みどり\nハウス\nテンボス\n２２号", distination: "博多",departure: "11:29", platform: "のりば 2"),
        TimeTable(id: 12, name: "みどり\nハウス\nテンボス\n２６号", distination: "博多",departure: "12:27", platform: "のりば 2"),
        TimeTable(id: 14, name: "みどり\nハウス\nテンボス\n３０号", distination: "博多",departure: "13:29", platform: "のりば 2"),
        TimeTable(id: 16, name: "みどり\nハウス\nテンボス\n３４号", distination: "博多",departure: "14:29", platform: "のりば 2"),
        TimeTable(id: 18, name: "みどり\nハウス\nテンボス\n38号", distination: "博多",departure: "15:28", platform: "のりば 2"),
        TimeTable(id: 30, name: "みどり\n６０号", distination: "博多",departure: "21:31", platform: "のりば 2")
    ]
    @State private var dateText = ""
    @State private var nowDate = Date()
    @State private var hakataTwoPlatHomeListIndex = 0

    private let dateFormatter = DateFormatter()
    
    var body: some View {
        VStack {
            MainTextView(text: "※次に「在来線のりば」から発車する博多行き特急列車のご案内", textSize: .largeTitle, color: .red)
                .padding(.top, 50)
            MainTextView(text: "佐世保線", textSize: .largeTitle, color: .white)
            MainTextView(text: "SaseboLine", textSize: .headline, color: .white)
            List(hakataTwoPlatHomeListIndex..<hakataTwoHomeTimeTableList.count, id: \.self) { index in
                HStack {
                    Text(hakataTwoHomeTimeTableList[index].name)
                        .h2Text(Color.train_red)
                    Spacer()
                    Text(hakataTwoHomeTimeTableList[index].distination)
                        .h1Text(Color.distination_orange)
                    Spacer()
                    Text(hakataTwoHomeTimeTableList[index].departure)
                        .h1Text(Color.time_green)
                    Spacer()
                    Text(hakataTwoHomeTimeTableList[index].platform)
                        .h1Text(Color.distination_orange)
                }
                .listRowBackground(Color.black)
                .frame(height : 200)
            }
            .padding(10)
        }
        .background(Color.main_blue)
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
                case HakataTwoPlathomeTimedata.midori_six:
                    hakataTwoPlatHomeListIndex = 0
                case HakataTwoPlathomeTimedata.midori_ten:
                    hakataTwoPlatHomeListIndex = 1
                case HakataTwoPlathomeTimedata.midori_eighteen:
                    hakataTwoPlatHomeListIndex = 2
                case HakataTwoPlathomeTimedata.midori_HTB_twentytwo:
                    hakataTwoPlatHomeListIndex = 3
                case HakataTwoPlathomeTimedata.midori_HTB_twentysix:
                    hakataTwoPlatHomeListIndex = 4
                case HakataTwoPlathomeTimedata.midori_HTB_thirty:
                    hakataTwoPlatHomeListIndex = 5
                case HakataTwoPlathomeTimedata.midori_thirtyfour:
                    hakataTwoPlatHomeListIndex = 6
                case HakataTwoPlathomeTimedata.midori_HTB_thirtyeight:
                    hakataTwoPlatHomeListIndex = 7
                case HakataTwoPlathomeTimedata.midori_sixty:
                    hakataTwoPlatHomeListIndex = 8
                default:
                    break
                }
            }
        }
    }
}

struct MainTextView: View {
    let text: String
    let textSize: Font
    let color: Color
    var isHeavy = true

    var body: some View {
        Text(text)
            .fontWeight(isHeavy ? .heavy : .regular)
            .foregroundColor(color)
            .font(textSize)
    }
}
/// Previewsは一番下に記載する
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//                    switch minute {
//                    case HakataTimeData.midori_two:
//                        hakataTimeTableListIndex = 0
//                    case HakataTimeData.relayKamome_four:
//                        hakataTimeTableListIndex = 1
//                    case HakataTimeData.midori_six:
//                        hakataTimeTableListIndex = 2
//                    case HakataTimeData.relaykamome_eight:
//                        hakataTimeTableListIndex = 3
//                    case HakataTimeData.midori_ten:
//                        hakataTimeTableListIndex = 4
//                    case HakataTimeData.relaykamome_twelve:
//                        hakataTimeTableListIndex = 5
//                    case HakataTimeData.midori_fourteen:
//                        hakataTimeTableListIndex = 6
//                    case HakataTimeData.relaykamome_sixteen:
//                        hakataTimeTableListIndex = 7
//                    case HakataTimeData.midori_eighteen:
//                        hakataTimeTableListIndex = 8
//                    case HakataTimeData.relaykamome_twenty:
//                        hakataTimeTableListIndex = 9
//                    case HakataTimeData.midori_HTB_twentytwo:
//                        hakataTimeTableListIndex = 10
//                    case HakataTimeData.relaykamome_twentyfour:
//                        hakataTimeTableListIndex = 11
//                    case HakataTimeData.midori_HTB_twentysix:
//                        hakataTimeTableListIndex = 12
//                    case HakataTimeData.relaykamome_twentyeight:
//                        hakataTimeTableListIndex = 13
//                    case HakataTimeData.midori_HTB_thirty:
//                        hakataTimeTableListIndex = 14
//                    case HakataTimeData.relaykamome_thirtytwo:
//                        hakataTimeTableListIndex = 15
//                    case HakataTimeData.midori_thirtyfour:
//                        hakataTimeTableListIndex = 16
//                    case HakataTimeData.relaykamome_thirtysix:
//                        hakataTimeTableListIndex = 17
//                    case HakataTimeData.midori_HTB_thirtyeight:
//                        hakataTimeTableListIndex = 18
//                    case HakataTimeData.relaykamome_forty:
//                        hakataTimeTableListIndex = 19
//                    case HakataTimeData.midori_HTB_fortytwo:
//                        hakataTimeTableListIndex = 20
//                    case HakataTimeData.relaykamome_fortyfour:
//                        hakataTimeTableListIndex = 21
//                    case HakataTimeData.midori_fortysix:
//                        hakataTimeTableListIndex = 22
//                    case HakataTimeData.relaykamome_fortyeight:
//                        hakataTimeTableListIndex = 23
//                    case HakataTimeData.sanjuuroku:
//                        hakataTimeTableListIndex = 24
//                    case HakataTimeData.midori_fifty:
//                        hakataTimeTableListIndex = 25
//                    case HakataTimeData.relaykamome_fiftytwo:
//                        hakataTimeTableListIndex = 26
//                    case HakataTimeData.midori_fiftyfour:
//                        hakataTimeTableListIndex = 27
//                    case HakataTimeData.relaykamome_fiftysix:
//                        hakataTimeTableListIndex = 28
//                    case HakataTimeData.midori_fiftyeight:
//                        hakataTimeTableListIndex = 29
//                    case HakataTimeData.midori_sixty:
//                        hakataTimeTableListIndex = 30
//                    case HakataTimeData.relaykamome_sixtytwo:
//                        hakataTimeTableListIndex = 31
//                    case HakataTimeData.relaykamome_sixtyfour:
//                        hakataTimeTableListIndex = 32
//
//                    default:
//                        break
//                    }




//            VStack {
//                MainTextView(text: "西九州新幹線")
//                MainTextView(text: "NishiKyushuShinkansen")
//                MainTextView(text: "長崎方面")
//                MainTextView(text: dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText, isHeavy: false)
//                List(nagasakiTimetableListIndex..<nagasakiTimeTableList.count, id: \.self) { index in
//                    HStack {
//                        Text(nagasakiTimeTableList[index].name)
//                            .h3Text(Color.train_red)
//                        Spacer()
//                        Text(nagasakiTimeTableList[index].distination)
//                            .h1Text(Color.distination_orange)
//                        Spacer()
//                        Text(nagasakiTimeTableList[index].departure)
//                            .h1Text(Color.time_green)
//                        Spacer()
//                        Text(nagasakiTimeTableList[index].platform)
//                            .h3Text(Color.distination_orange)
//                    }
//                    .listRowBackground(Color.black)
//                    .frame(height : 200)
//                }
//                HStack {
//                    Button(action: {
//
//                    }) {
//                        Text("送り")
//                            .foregroundColor(.white)
//                    }
//
//                    Button(action: {
//
//                    }) {
//                        Text("リセット")
//                            .foregroundColor(.white)
//                    }
//                }
//                .padding(100)
//            }
//            .background(Color("main_blue"))
//            .onAppear {
//                UITableView.appearance().backgroundColor = .clear
//                dateFormatter.dateFormat = "HH:mm"
//                let dateFormatterHH = DateFormatter()
//                let dateFormattermm = DateFormatter()
//                dateFormatterHH.dateFormat = "HH"
//                dateFormattermm.dateFormat = "mm"
//                dateFormatterHH.locale = Locale(identifier: "ja_jp")
//                dateFormattermm.locale = Locale(identifier: "ja_jp")
//                dateFormatter.locale = Locale(identifier: "ja_jp")
//                /// .onAppearは一つにまとめる。
//                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//                    self.nowDate = Date()
//                    dateText = "\(dateFormatter.string(from: nowDate))"
//                    let hh = Int(dateFormatterHH.string(from: nowDate))!*60
//                    let mm = Int(dateFormattermm.string(from: nowDate))!
//                    let minute = hh + mm
//
//                    switch minute {
//                    case NagasakiTimeData.kamome_One:
//                        nagasakiTimetableListIndex = 0
//                    case NagasakiTimeData.kamome_three:
//                        nagasakiTimetableListIndex = 1
//                    case NagasakiTimeData.kamome_five:
//                        nagasakiTimetableListIndex = 2
//                    case NagasakiTimeData.kamome_nine:
//                        nagasakiTimetableListIndex = 3
//                    case NagasakiTimeData.kamome_thirteen:
//                        nagasakiTimetableListIndex = 4
//                    case NagasakiTimeData.kamome_seventeen:
//                        nagasakiTimetableListIndex = 5
//                    case NagasakiTimeData.kamome_twenty_one:
//                        nagasakiTimetableListIndex = 6
//                    case NagasakiTimeData.kamome_twenty_five:
//                        nagasakiTimetableListIndex = 7
//                    case NagasakiTimeData.kamome_forty_nine:
//                        nagasakiTimetableListIndex = 8
//                    case NagasakiTimeData.kamome_thirty_three:
//                        nagasakiTimetableListIndex = 9
//                    case NagasakiTimeData.kamome_thirty_seven:
//                        nagasakiTimetableListIndex = 10
//                    case NagasakiTimeData.kamome_forty_one:
//                        nagasakiTimetableListIndex = 11
//                    case NagasakiTimeData.kamome_forty_three:
//                        nagasakiTimetableListIndex = 12
//                    case NagasakiTimeData.kamome_forty_five:
//                        nagasakiTimetableListIndex = 13
//                    case NagasakiTimeData.kamome_forty_seven:
//                        nagasakiTimetableListIndex = 14
//                    case NagasakiTimeData.kamome_forty_nine:
//                        nagasakiTimetableListIndex = 15
//                    case NagasakiTimeData.kamome_fifty_one:
//                        nagasakiTimetableListIndex = 16
//                    case NagasakiTimeData.kamome_fifty_three:
//                        nagasakiTimetableListIndex = 17
//                    case NagasakiTimeData.kamome_fifty_five:
//                        nagasakiTimetableListIndex = 18
//                    case NagasakiTimeData.kamome_fifty_seven:
//                        nagasakiTimetableListIndex = 19
//                    case NagasakiTimeData.kamome_sixty_one:
//                        nagasakiTimetableListIndex = 20
//                    case NagasakiTimeData.kamome_sixty_five:
//                        nagasakiTimetableListIndex = 21
//                    default:
//                        break
//                    }
//                }
//            }
