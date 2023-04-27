//
//  SettingScreenView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 09.04.2023.
//

import SwiftUI

struct SettingScreenView: View {
    
    @State private var tabBar: UITabBar! = nil
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(cgColor: CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1))]
    }
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 21) {
                    NavigationLink(destination: DailyIntakeLevelViewInSetting()
                        .navigationBarBackButtonHidden(true)) {
                            DailyIntakeLevel()
                        }.toolbar(.hidden, for: .tabBar)
                    .foregroundColor(.black)
                    NavigationLink(destination: GoalScreenView().navigationBarBackButtonHidden(true)) {
                        getListForGoalAndReminderInSetting(text: "Your goal")
                    } .foregroundColor(.black)
                    NavigationLink(destination: ReminderScreenView()
                        .navigationBarBackButtonHidden(true)) {
                        getListForGoalAndReminderInSetting(text: "Reminder")
                    }.foregroundColor(.black)
                }
            }
            .navigationTitle("EDIT").font(.custom("SF-Pro-Display-BlackItalic", size: 17))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                withAnimation(.default) {
                    waterBalanceModel.isShowTabView = true
                }
            }
            .statusBar(hidden: true)
            .padding(.top, 31)
        }
    }
}


struct DailyIntakeLevel: View {
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    var body: some View {
        VStack(spacing: 11) {
            HStack {
                Text("Daily Intake Level")
                    .font(.custom("SF-Pro-Text-Regular", size: 17))
                Spacer()
                Text("\(waterBalanceModel.getDailyIntake) ML")
                    .font(.custom("SF-Pro-Text-Regular", size: 17))
                    .foregroundColor(Color(CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)))
                    .padding(.trailing, 12)
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)))
            }
            .padding([.leading, .trailing], 16)
            Divider()
        }
        .onAppear{
            guard let gotDailyIntake = UserDefaults.standard.value(forKey: "setDailyIntake")
            else{return}

            self.waterBalanceModel.getDailyIntake = gotDailyIntake as! Int
        }
    }
}
extension View {
    func getListForGoalAndReminderInSetting(text: String) -> some View {
        VStack(spacing: 11) {
        HStack {
                Text(text)
                .font(.custom("SF-Pro-Text-Regular", size: 17))
            Spacer()
                Image(systemName: "chevron.right")
                .foregroundColor(Color(CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)))
            }
        .padding([.leading, .trailing], 16)
            Divider()
        }
    }
}

struct SettingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreenView()
            .environmentObject(WaterBalanceModel())
    }
}
