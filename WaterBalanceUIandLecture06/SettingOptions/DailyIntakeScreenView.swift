//
//  DailyIntakeScreenView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 09.04.2023.
//

import SwiftUI

struct DailyIntakeScreenView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(cgColor: CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1))]
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    var body: some View {
        
        VStack {
            TitleText(text: "Water intake?")
                .padding(.top, 182)
            ZStack {
                BackgroundRectangle(height: 108)
                HStack(spacing: 12) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 250, height: 60)
                        TextField("200", text: Binding(
                            get: { String(waterBalanceModel.intake) },
                            set: { waterBalanceModel.intake = Int($0) ?? 0 }
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
                    savedIntake()
                    timeIntake()
                    waterBalanceModel.arrayFromIntakeInt.append("\(savedIntake())")
                    waterBalanceModel.arrayFromIntake.append("\(timeIntake())")
                    withAnimation {
                        dismiss()
                    }
                }
                .padding(.bottom, 50)
        }
        .padding(.horizontal, 16)
        .background(Color(CGColor(red: 0.988, green: 0.992, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("WATER").font(.custom("SF-Pro-Display-BlackItalic", size: 17))
        .navigationBarTitleDisplayMode(.inline)
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
    
    func savedIntake() {
        UserDefaults.standard.set(self.waterBalanceModel.intake, forKey: "setIntake")
    }
    func getSavedIntake() {
        waterBalanceModel.getIntake = UserDefaults.standard.integer(forKey: "setIntake")
    }
    func timeIntake() {
        UserDefaults.standard.set(self.getTimeWaterIntake(), forKey: "timeWaterIntake")
    }
    func saveTimeIntake() {
        waterBalanceModel.saveTimeIntake = UserDefaults.standard.string(forKey: "timeWaterIntake") ?? ""
    }
    func getTimeWaterIntake() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let currentTime = Date()
        let time = formatter.string(from: currentTime)
        return time
    }
}

extension Dictionary {
    init(keys: [Key], values: [Value]) {
        self.init()
        
        for (key, value) in zip(keys, values) {
            self[key] = value
        }
    }
}
struct DailyIntakeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DailyIntakeScreenView()
            .environmentObject(WaterBalanceModel())
        
    }
}
