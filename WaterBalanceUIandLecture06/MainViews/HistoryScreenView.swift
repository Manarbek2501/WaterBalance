//
//  HistoryScreenView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 09.04.2023.
//

import SwiftUI

struct HistoryScreenView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(cgColor: CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1))]
    }
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 68) {
                    List{
                        Section("\(formattedDate())") {
                                HStack {
                                    Text("\( UserDefaults.standard.integer(forKey: "setIntake")) ml")
                                    Spacer()
                                    Text("\(UserDefaults.standard.string(forKey: "timeWaterIntake") ?? "")")
                                        .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263))
                                }
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                            
                        }
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle("HISTORY").font(.custom("SF-Pro-Display-BlackItalic", size: 17))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func formattedDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "USA")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.doesRelativeDateFormatting = true
        
        let someDate = Date()
        let formattedDate = dateFormatter.string(from: someDate)
        
        return formattedDate
    }
}

extension View {
    func sectionTitle(text: String) -> some View {
        VStack(alignment: .leading, content: {
            Section(text, content: {
                VStack(spacing: 20,content: {
                    sections(textTimer: "250 ml", textTime: "12:13")
                    Divider()
                    sections(textTimer: "200 ml", textTime: "14:10")
                    Divider()
                    sections(textTimer: "50 ml", textTime: "15:13")
                    Divider()
                    sections(textTimer: "300 ml", textTime: "19:10")
                    Divider()
                })
            })
            .font(.custom("SF-Pro-Text-Semibold", size: 20))
        })
    }
}


extension View {
    func sections(textTimer: String, textTime: String) -> some View {
        HStack(content: {
            Text(textTimer).foregroundColor(.black)
                .font(.custom("SF-Pro-Text-Regular", size: 17))
            Spacer()
            Text(textTime).foregroundColor(Color(CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)))
                .font(.custom("SF-Pro-Text-Regular", size: 17))
        }).padding(.top, 15)
    }
}


struct HistoryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryScreenView()
            .environmentObject(WaterBalanceModel())
            .environment(\.locale, Locale(identifier: "ru_RU"))
    }
}
