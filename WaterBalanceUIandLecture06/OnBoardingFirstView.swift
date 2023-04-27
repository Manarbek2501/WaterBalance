//
//  OnBoardingFirstView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 25.04.2023.
//

import SwiftUI

struct OnBoardingFirstView: View {
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .foregroundColor(Color(CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1)))
                .font(.system(size: 24))
                .italic()
                .fontWeight(.black)
                .frame(maxWidth: .infinity)
                .padding(.top, 108)
            Text("What is your goal?")
                .foregroundColor(Color(CGColor(red: 0.185, green: 0.183, blue: 0.201, alpha: 1)))
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.top, 62)
            ChoiceGoalViews()
                .padding(.top, 32)
            Spacer()
            CustomButton(name: "Next")
                .padding(.bottom, 50)
        }
        .padding([.leading, .trailing], 16)
        .background(Color(CGColor(red: 0.988, green: 0.992, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}
struct BackgroundRectangle: View {
    let height: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(CGColor(red: 0.833, green: 0.882, blue: 0.972, alpha: 1)))
            .frame(height: height)
    }
}

struct ChoiceGoalViews: View {

    enum ItemTypes {
        case first
        case second
        case third
        case fourth
    }

    @State var firstItem: Bool = true
    @State var secondItem: Bool = false
    @State var thirdItem: Bool = false
    @State var fourthItem: Bool = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(CGColor(red: 0.833, green: 0.882, blue: 0.972, alpha: 1)))

            VStack(alignment: .center, spacing: 14) {
                ChoiceGoalView(title: "Goal Number One", selected: $firstItem)

                ChoiceGoalView(title: "Goal Number Two", selected:  $secondItem)


                ChoiceGoalView(title: "Goal Number Three", selected:  $thirdItem)


                ChoiceGoalView(title: "Goal Number Four", selected:  $fourthItem)

            }
            .padding(.horizontal, 19)
            .padding(.vertical, 24)
        }
        .frame(height: 330)
        .onChange(of: firstItem) { newValue in
            handleToggles(itemTypes: .first, newValue: newValue)
        }
        .onChange(of: secondItem) { newValue in
            handleToggles(itemTypes: .second, newValue: newValue)
        }
        .onChange(of: thirdItem) { newValue in
            handleToggles(itemTypes: .third, newValue: newValue)
        }
        .onChange(of: fourthItem) { newValue in
            handleToggles(itemTypes: .fourth, newValue: newValue)
        }
    }

    func handleToggles(itemTypes: ItemTypes, newValue: Bool) {
        switch itemTypes {
        case .first:
            if newValue == true {
                secondItem = false
                thirdItem = false
                fourthItem = false
            }
        case .second:
            if newValue == true {
                firstItem = false
                thirdItem = false
                fourthItem = false
            }
        case .third:
            if newValue == true {
                firstItem = false
                secondItem = false
                fourthItem = false
            }
        case .fourth:
            if newValue == true {
                firstItem = false
                secondItem = false
                thirdItem = false
            }
        }
    }
}

struct ChoiceGoalView: View {
    var title: String
    @Binding var selected: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 0.988, green: 0.992, blue: 1))
            HStack {
                Text(title)
                    .foregroundColor(Color(red: 0.184, green: 0.184, blue: 0.2))
                    .font(.system(size: 16))
                    .fontWeight(.semibold)

                Spacer()

                Image(selected ? "checked" : "unchecked")
            }
            .padding([.leading, .trailing], 24)
        }
        .onTapGesture {
            self.selected.toggle()
        }
    }
}

struct OnBoardingFirstView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingFirstView()
    }
}
