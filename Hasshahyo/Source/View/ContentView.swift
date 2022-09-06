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

struct HakataTimeData {
    static let midori_two = 0...412
    static let relayKamome_four = 412...451
    static let midori_six = 451...478
    static let relaykamome_eight = 478...499
    static let midori_ten = 499...533
    static let relaykamome_twelve = 533...546
    static let midori_fourteen = 546...591
    static let relaykamome_sixteen = 591...616
    static let midori_eighteen = 616...651
    static let relaykamome_twenty = 651...677
    static let midori_HTB_twentytwo = 677...689
    static let relaykamome_twentyfour = 689...736
    static let midori_HTB_twentysix = 736...747
    static let relaykamome_twentyeight = 747...795
    static let midori_HTB_thirty = 795...809
    static let relaykamome_thirtytwo = 809...856
    static let midori_thirtyfour = 856...869
    static let relaykamome_thirtysix = 869...916
    static let midori_HTB_thirtyeight = 916...928
    static let relaykamome_forty = 928...976
    static let midori_HTB_fortytwo = 976...1002
    static let relaykamome_fortyfour = 1002...1033
    static let midori_fortysix = 1033...1070
    static let relaykamome_fortyeight = 1070...1095
    static let sanjuuroku = 1095...1104
    static let midori_fifty = 1104...1128
    static let relaykamome_fiftytwo = 1128...1155
    static let midori_fiftyfour = 1155...1191
    static let relaykamome_fiftysix = 1191...1218
    static let midori_fiftyeight = 1218...1257
    static let midori_sixty = 1257...1291
    static let relaykamome_sixtytwo = 1291...1309
    static let relaykamome_sixtyfour = 1309...1363
}

struct NagasakiTimeData {
    static let kamome_One = 0...423
    static let kamome_three = 423...463
    static let kamome_five = 463...509
    static let kamome_nine = 509...559
    static let kamome_thirteen = 559...600
    static let kamome_seventeen = 600...661
    static let kamome_twenty_one = 661...718
    static let kamome_twenty_five = 718...776
    static let kamome_twenty_nine = 776...838
    static let kamome_thirty_three = 838...896
    static let kamome_thirty_seven = 896...957
    static let kamome_forty_one = 957...1018
    static let kamome_forty_three = 1018...1044
    static let kamome_forty_five = 1044...1080
    static let kamome_forty_seven = 1080...1105
    static let kamome_forty_nine = 1105...1139
    static let kamome_fifty_one = 1139...1165
    static let kamome_fifty_three = 1165...1202
    static let kamome_fifty_five = 1202...1230
    static let kamome_fifty_seven = 1230...1266
    static let kamome_sixty_one = 1266...1322
    static let kamome_sixty_five = 1322...1392
}

struct ContentView: View {

    private let dateFormatter = DateFormatter()
    @State private var dateText = ""
    @State private var nowDate = Date()
    @State private var hakataTimeTableListIndex = 0
    @State private var nagasakiTimetableListIndex = 0

    @State private var hakataTimeTableList:[TimeTable] = [
        TimeTable(id: 0, name: "みどり\n２号",distination: "博多",departure: "6:52", platform: "のりば10"),
        TimeTable(id: 1, name: "リレー\nかもめ\n４号", distination: "博多",departure: "7:31", platform: "のりば2"),
        TimeTable(id: 2, name: "みどり\n６号", distination: "博多",departure: "7:58", platform: "のりば2"),
        TimeTable(id: 3, name: "リレー\nかもめ\n８号", distination: "博多",departure: "8:19", platform: "のりば10"),
        TimeTable(id: 4, name: "みどり\n１０号", distination: "博多",departure: "8:53", platform: "のりば 2"),
        TimeTable(id: 5, name: "リレー\nかもめ\n１２号", distination: "博多",departure: "9:06", platform: "のりば10"),
        TimeTable(id: 6, name: "みどり\n１４号", distination: "博多",departure: "9:51", platform: "のりば10"),
        TimeTable(id: 7, name: "リレー\nかもめ\n１６号", distination: "博多",departure: "10:16", platform: "のりば10"),
        TimeTable(id: 8, name: "みどり\n１８号", distination: "博多",departure: "10:51", platform: "のりば 2"),
        TimeTable(id: 9, name: "リレー\nかもめ２０号", distination: "博多",departure: "11:17", platform: "のりば10"),
        TimeTable(id: 10, name: "みどり\nハウステンボス\n２２号", distination: "博多",departure: "11:29", platform: "のりば 2"),
        TimeTable(id: 11, name: "リレー\nかもめ\n２４号", distination: "博多",departure: "12:16", platform: "のりば10"),
        TimeTable(id: 12, name: "みどり\nハウステンボス\n２６号", distination: "博多",departure: "12:27", platform: "のりば　2"),
        TimeTable(id: 13, name: "リレー\nかもめ\n２８号", distination: "博多",departure: "13:15", platform: "のりば10"),
        TimeTable(id: 14, name: "みどり\nハウステンボス\n３０号", distination: "博多",departure: "13:29", platform: "のりば　2"),
        TimeTable(id: 15, name: "リレー\nかもめ\n３２号", distination: "博多",departure: "14:16", platform: "のりば10"),
        TimeTable(id: 16, name: "みどり\nハウステンボス\n３４号", distination: "博多",departure: "14:29", platform: "のりば10"),
        TimeTable(id: 17, name: "リレー\nかもめ\n３６号", distination: "博多",departure: "15:16", platform: "のりば10"),
        TimeTable(id: 18, name: "みどり\nハウス\nテンボス\n38号", distination: "博多",departure: "15:28", platform: "のりば 2"),
        TimeTable(id: 19, name: "リレー\nかもめ\n４０号", distination: "博多",departure: "16:16", platform: "のりば10"),
        TimeTable(id: 20, name: "みどり\nハウステンボス\n４２号", distination: "博多",departure: "16:42", platform: "のりば 1"),
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

    @State private var nagasakiTimeTableList:[TimeTable] = [
        TimeTable(id: 0, name: "かもめ\n１号",distination: "長崎",departure: "7:03", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ\n６５号", distination: "長崎",departure: "7:43", platform: "のりば11"),
        TimeTable(id: 2, name: "かもめ\n３号", distination: "長崎",departure: "8:29", platform: "のりば11"),
        TimeTable(id: 3, name: "かもめ\n５号", distination: "長崎",departure: "9:19", platform: "のりば11"),
        TimeTable(id: 4, name: "かもめ\n９号", distination: "長崎",departure: "10:00", platform: "のりば11"),
        TimeTable(id: 5, name: "かもめ\n１３号", distination: "長崎",departure: "11:01", platform: "のりば11"),
        TimeTable(id: 6, name: "かもめ\n１７号", distination: "長崎",departure: "11:58", platform: "のりば11"),
        TimeTable(id: 7, name: "かもめ\n２１号", distination: "長崎",departure: "12:56", platform: "のりば11"),
        TimeTable(id: 8, name: "かもめ\n２５号", distination: "長崎",departure: "13:58", platform: "のりば11"),
        TimeTable(id: 9, name: "かもめ\n２９号", distination: "長崎",departure: "14:56", platform: "のりば11"),
        TimeTable(id: 10, name: "かもめ\n３３号", distination: "長崎",departure: "15:57", platform: "のりば11"),
        TimeTable(id: 11, name: "かもめ\n３７号", distination: "長崎",departure: "16:58", platform: "のりば11"),
        TimeTable(id: 12, name: "かもめ\n４１号", distination: "長崎",departure: "17:24", platform: "のりば11"),
        TimeTable(id: 13, name: "かもめ\n４３号", distination: "長崎",departure: "18:00", platform: "のりば11"),
        TimeTable(id: 14, name: "かもめ\n４５号", distination: "長崎",departure: "18:25", platform: "のりば11"),
        TimeTable(id: 15, name: "かもめ\n４７号", distination: "長崎",departure: "18:59", platform: "のりば11"),
        TimeTable(id: 16, name: "かもめ\n４９号", distination: "長崎",departure: "19:25", platform: "のりば11"),
        TimeTable(id: 17, name: "かもめ\n５１号", distination: "長崎",departure: "20:02", platform: "のりば11"),
        TimeTable(id: 18, name: "かもめ\n５３号", distination: "長崎",departure: "20:30", platform: "のりば11"),
        TimeTable(id: 19, name: "かもめ\n５５号", distination: "長崎",departure: "21:06", platform: "のりば11"),
        TimeTable(id: 20, name: "かもめ\n５７号", distination: "長崎",departure: "22:02", platform: "のりば11"),
        TimeTable(id: 21, name: "かもめ\n６１号", distination: "長崎",departure: "23:12", platform: "のりば11")
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

                    }) {
                        Text("送り")
                            .foregroundColor(.white)
                    }
                    Button(action: {

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
                    case 0...412:
                        hakataTimeTableListIndex = 0
                    case 412...451:
                        hakataTimeTableListIndex = 1
                    case 451...478:
                        hakataTimeTableListIndex = 2
                    case 478...499:
                        hakataTimeTableListIndex = 3
                    case 499...533:
                        hakataTimeTableListIndex = 4
                    case 533...546:
                        hakataTimeTableListIndex = 5
                    case 546...591:
                        hakataTimeTableListIndex = 6
                    case 591...616:
                        hakataTimeTableListIndex = 7
                    case 616...651:
                        hakataTimeTableListIndex = 8
                    case 651...677:
                        hakataTimeTableListIndex = 9
                    case 677...689:
                        hakataTimeTableListIndex = 10
                    case 689...736:
                        hakataTimeTableListIndex = 11
                    case 736...747:
                        hakataTimeTableListIndex = 12
                    case 747...795:
                        hakataTimeTableListIndex = 13
                    case 795...809:
                        hakataTimeTableListIndex = 14
                    case 809...856:
                        hakataTimeTableListIndex = 15
                    case 856...869:
                        hakataTimeTableListIndex = 16
                    case 869...916:
                        hakataTimeTableListIndex = 17
                    case 916...928:
                        hakataTimeTableListIndex = 18
                    case 928...976:
                        hakataTimeTableListIndex = 19
                    case 976...1002:
                        hakataTimeTableListIndex = 20
                    case 1002...1033:
                        hakataTimeTableListIndex = 21
                    case 1033...1070:
                        hakataTimeTableListIndex = 22
                    case 1070...1095:
                        hakataTimeTableListIndex = 23
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
                        Text("送り")
                            .foregroundColor(.white)
                    }

                    Button(action: {

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
                    case NagasakiTimeData.kamome_One:
                        nagasakiTimetableListIndex = 0
                    case NagasakiTimeData.kamome_three:
                        nagasakiTimetableListIndex = 1
                    case NagasakiTimeData.kamome_five:
                        nagasakiTimetableListIndex = 2
                    case NagasakiTimeData.kamome_nine:
                        nagasakiTimetableListIndex = 3
                    case NagasakiTimeData.kamome_thirteen:
                        nagasakiTimetableListIndex = 4
                    case NagasakiTimeData.kamome_seventeen:
                        nagasakiTimetableListIndex = 5
                    case NagasakiTimeData.kamome_twenty_one:
                        nagasakiTimetableListIndex = 6
                    case NagasakiTimeData.kamome_twenty_five:
                        nagasakiTimetableListIndex = 7
                    case NagasakiTimeData.kamome_forty_nine:
                        nagasakiTimetableListIndex = 8
                    case NagasakiTimeData.kamome_thirty_three:
                        nagasakiTimetableListIndex = 9
                    case NagasakiTimeData.kamome_thirty_seven:
                        nagasakiTimetableListIndex = 10
                    case NagasakiTimeData.kamome_forty_one:
                        nagasakiTimetableListIndex = 11
                    case NagasakiTimeData.kamome_forty_three:
                        nagasakiTimetableListIndex = 12
                    case NagasakiTimeData.kamome_forty_five:
                        nagasakiTimetableListIndex = 13
                    case NagasakiTimeData.kamome_forty_seven:
                        nagasakiTimetableListIndex = 14
                    case NagasakiTimeData.kamome_forty_nine:
                        nagasakiTimetableListIndex = 15
                    case NagasakiTimeData.kamome_fifty_one:
                        nagasakiTimetableListIndex = 16
                    case NagasakiTimeData.kamome_fifty_three:
                        nagasakiTimetableListIndex = 17
                    case NagasakiTimeData.kamome_fifty_five:
                        nagasakiTimetableListIndex = 18
                    case NagasakiTimeData.kamome_fifty_seven:
                        nagasakiTimetableListIndex = 19
                    case NagasakiTimeData.kamome_sixty_one:
                        nagasakiTimetableListIndex = 20
                    case NagasakiTimeData.kamome_sixty_five:
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

