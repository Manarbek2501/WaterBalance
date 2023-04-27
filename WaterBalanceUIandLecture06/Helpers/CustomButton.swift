//
//  CustomButton.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 25.04.2023.
//

import SwiftUI

struct CustomButton: View {
    let name: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(CGColor(red: 0.094, green: 0.408, blue: 0.992, alpha: 1)))
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22))
                .fontWeight(.semibold)
        }
        .frame(height: 60)
    }
}
