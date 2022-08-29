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

    var hakataTimeTableList = [
        TimeTable(id: 0, name: "リレーつばめ２号",distination: "博多",departure: "6:56", platform: "のりば10"),
        TimeTable(id: 1, name: "みどり　　　４号", distination: "博多",departure: "7:00", platform: "のりば 2"),
        TimeTable(id: 2, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 3, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 4, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
        TimeTable(id: 5, name: "リレーかもめ６号", distination: "博多",departure: "7:30", platform: "のりば10"),
    ]

    var nagasakiTimeTableList = [
        TimeTable(id: 0, name: "かもめ２号",distination: "長崎",departure: "8:00", platform: "のりば11"),
        TimeTable(id: 1, name: "かもめ４号", distination: "長崎",departure: "8:30", platform: "のりば11"),
        TimeTable(id: 2, name: "かもめ６号", distination: "長崎",departure: "9:00", platform: "のりば11")
    ]

    @State var dateText = ""
    @State var nowDate = Date()
    private let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("佐世保線")
                        .fontWeight(.heavy)
                        .modifier(MainTextModifier())
                    Text("SaseboLine")
                        .fontWeight(.heavy)
                        .modifier(MainTextModifier())
                    Text("博多方面")
                        .fontWeight(.heavy)
                        .modifier(MainTextModifier())
                    List(hakataTimeTableList) { timeTableList in
                        HStack {
                            Text(timeTableList.name)
                                .h1Text(Color("train_red"))
                            Spacer()
                            Text(timeTableList.distination)
                                .h1Text(Color("distination_orange"))
                            Spacer()
                            Text(timeTableList.departure)
                                .h1Text(Color("time_green"))
                            Text(timeTableList.platform)
                                .h2Text(Color("distination_orange"))
                        }
                        .listRowBackground(Color.black)
                        .frame(height : 200)
                    }
                    .onAppear {
                        UITableView.appearance().backgroundColor = UIColor.clear
                    }
                }
                VStack {
                    Text("西九州新幹線")
                        .fontWeight(.heavy)
                        .modifier(MainTextModifier())
                    Text("nishi-kyushushinkansen")
                        .fontWeight(.heavy)
                        .modifier(MainTextModifier())
                    Text("長崎方面")
                        .fontWeight(.heavy)
                        .modifier(MainTextModifier())
                    List(nagasakiTimeTableList) { timeTableList in
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
                }
            }
            .background(Color("main_blue"))
            Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        dateText = "\(dateFormatter.string(from: nowDate))"
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 別ファイルに記載
extension Text {
    func h1Text(_ foregroundColor: Color) -> Text {
        self
            .foregroundColor(foregroundColor)
            .font(.mainFont(size: 30))
            .fontWeight(.heavy)
    }

    func h2Text(_ foregroundColor: Color) -> Text {
        self
            .foregroundColor(foregroundColor)
            .font(.mainFont(size: 20))
            .fontWeight(.heavy)
    }
}

extension Font {
    static func mainFont(size: CGFloat) -> Font {
        return Font.custom("JF-Dot-Izumi-16-Bold", size: size)
    }
}

// MARK: - Modifier
struct MainTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.white))
            .font(.largeTitle)
    }
}

