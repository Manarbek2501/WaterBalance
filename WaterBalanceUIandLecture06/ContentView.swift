//
//  ContentView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 08.04.2023.
//

import SwiftUI

enum Tabs: Hashable {
    case main
    case settings
    case history
}


struct ContentView: View {
    
    @State private var selectedTab: Tabs = .main
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    var body: some View {
            TabView(selection: $selectedTab) {
                if waterBalanceModel.isShowTabView {
                    
                    MainScreenView()
                    
                        .tabItem {
                            Label("Main", systemImage: "homekit")
                        }
                        .tag(Tabs.main)
                    
                    SettingScreenView()
                        .tabItem {
                            Label("Settings", systemImage: "slider.horizontal.3")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .tag(Tabs.settings)
                    
                    HistoryScreenView()
                    
                        .tabItem {
                            Label("History", systemImage: "doc")
                        }
                        .tag(Tabs.history)
                }
            }
            .tint(Color(CGColor(red: 0.094, green: 0.408, blue: 0.992, alpha: 1)))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WaterBalanceModel())
    }
}
