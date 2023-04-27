//
//  RemindSelectButton.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 25.04.2023.
//

import SwiftUI

struct ReminderButton: View {
    var title: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.988, green: 0.992, blue: 1))
            Text(title)
                .foregroundColor(Color(red: 0.184, green: 0.184, blue: 0.2))
                .font(.system(size: 16))
                .fontWeight(.semibold)
        }
        .frame(height: 60)
    }
}
