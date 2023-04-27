//
//  WaterBalanceModel.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 24.04.2023.
//

import SwiftUI

class WaterBalanceModel: ObservableObject {
    @Published var isShowTabView: Bool = true
    @Published var intake: Int = 0
    @Published var getIntake = 0
    @Published var dailyIntake: Int = 0
    @Published var getDailyIntake = 0
    @Published var timeIntake = ""
    @Published var saveTimeIntake = ""
    @Published var dictionaryFromIntake: [Int: String] = [:]
    @Published var arrayFromIntakeInt: [String] = []
    @Published var arrayFromIntake: [String] = []
}
