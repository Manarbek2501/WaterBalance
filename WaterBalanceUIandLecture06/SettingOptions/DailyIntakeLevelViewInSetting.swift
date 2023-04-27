//
//  DailyIntakeLevelViewInSetting.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 25.04.2023.
//

import SwiftUI

struct DailyIntakeLevelViewInSetting: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    var body: some View {
        
        VStack {
            Text("WATER BALANCE")
                .foregroundColor(Color(CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1)))
                .font(.system(size: 24))
                .italic()
                .fontWeight(.black)
                .frame(maxWidth: .infinity)
                .padding(.top, 108)
            TitleText(text: "Daily intake?")
                .padding(.top, 62)
            ZStack {
                BackgroundRectangle(height: 108)
                HStack(spacing: 12) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 250, height: 60)
                        TextField("200", text: Binding(
                            get: { String(waterBalanceModel.dailyIntake) },
                            set: { waterBalanceModel.dailyIntake = Int($0) ?? 0 }
                        ))
                            .frame(width: 202)
                            .textFieldStyle(.plain)
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("ML").font(.custom("SF-Pro-Text-Semibold", size: 16))
                }
            }
            Spacer()
            CustomButton(name: "Add")
                .onTapGesture {
                    savedDailyIntake()
                    getSavedDailyIntake()
                    withAnimation {
                        dismiss()
                    }
                }
                .padding(.bottom, 50)
        }
        .padding(.horizontal, 16)
        .background(Color(CGColor(red: 0.988, green: 0.992, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            withAnimation(.easeInOut(duration: 0.5)) {
                waterBalanceModel.isShowTabView = false
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                } ) {
                    Image(systemName: "chevron.backward")
                        .font(.custom("SF-Pro-Display-Medium", size: 23))
                        .foregroundColor(Color(CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1)))
                }.frame(width: 18, height: 24)
            }
    }
    }
    
    func savedDailyIntake() {
        UserDefaults.standard.set(self.waterBalanceModel.dailyIntake, forKey: "setDailyIntake")
    }
    func getSavedDailyIntake() {
        waterBalanceModel.getDailyIntake = UserDefaults.standard.integer(forKey: "setDailyIntake")
    }
}

struct DailyIntakeLevelViewInSetting_Previews: PreviewProvider {
    static var previews: some View {
        DailyIntakeLevelViewInSetting()
            .environmentObject(WaterBalanceModel())
    }
}
