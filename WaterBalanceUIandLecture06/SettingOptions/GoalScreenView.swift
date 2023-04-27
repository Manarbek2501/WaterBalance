//
//  GoalScreenView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 09.04.2023.
//

import SwiftUI


struct GoalScreenView: View {
//    @State var selectedItem: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(cgColor: CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1))]

    }
    var body: some View {
        
            VStack {
                TitleText(text: "What is your goal?")
                    .padding(.top, 182)
                ChoiceGoalViews()
                    .padding(.top, 32)
                Spacer()
                CustomButton(name: "Save")
                    .padding(.bottom, 50)
            }
            .padding(.horizontal, 16)
            .background(Color(CGColor(red: 0.988, green: 0.992, blue: 1, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("THE GOAL").font(.custom("SFProDisplay-BlackItalic", size: 17))
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
                            .font(.custom("SFProDisplay-Medium", size: 23))
                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1)))
                    }.frame(width: 18, height: 24)
                }
        }
        }
}

struct GoalScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GoalScreenView()
            .environmentObject(WaterBalanceModel())
    }
}
