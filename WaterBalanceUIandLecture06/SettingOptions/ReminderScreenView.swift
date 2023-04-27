//
//  ReminderScreenView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 09.04.2023.
//

import SwiftUI

struct ReminderScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isSelected = false
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(cgColor: CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1))]
    }
    
    var body: some View {
        VStack {
            TitleText(text: "Remind me each")
                .padding(.top, 182)
            ChoiceReminderViews()
                .padding(.top, 32)
            Spacer()
            CustomButton(name: "Save")
                .padding(.bottom, 50)
        }
        .padding(.horizontal, 16)
        .background(Color(CGColor(red: 0.988, green: 0.992, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("REMINDER").font(Font.custom("SF-Pro-Display-BlackItalic", size: 17))
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
                        .font(Font.custom("SF-Pro-Display-Medium", size: 23, relativeTo: .title))
                        .foregroundColor(Color(CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1)))
                }.frame(width: 18, height: 24)
            }
        }
    }
}

struct ChoiceReminderViews: View {
    var body: some View {
        ZStack {
            BackgroundRectangle(height: 330)
            VStack(spacing: 14) {
                HStack(spacing: 14){
                    ReminderButton(title: "15 minutes")
                    ReminderButton(title: "30 minutes")
                }
                HStack(spacing: 14){
                    ReminderButton(title: "45 minutes")
                    ReminderButton(title: "1 hour")
                }
                HStack(spacing: 14){
                    ReminderButton(title: "1,5 hours")
                    ReminderButton(title: "2 hours")
                }
                HStack(spacing: 14){
                    ReminderButton(title: "3 hours")
                    ReminderButton(title: "4 hours")
                }
            }
            .padding(.horizontal, 19)
            .padding(.vertical, 24)
        }

    }
}
struct ReminderScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderScreenView()
            .environmentObject(WaterBalanceModel())
    }
}
