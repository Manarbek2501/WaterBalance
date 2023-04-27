//
//  WaterBalanceUIandLecture06App.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 08.04.2023.
//

import SwiftUI

@main
struct WaterBalanceUIandLecture06App: App {
    @StateObject var waterBalanceModel: WaterBalanceModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(waterBalanceModel)
        }
    }
}
