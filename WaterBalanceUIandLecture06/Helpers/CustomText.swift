//
//  CustomText.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 25.04.2023.
//

import SwiftUI

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 36))
            .fontWeight(.semibold)
    }
}
