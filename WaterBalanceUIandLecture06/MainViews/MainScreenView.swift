//
//  MainScreenView.swift
//  WaterBalanceUIandLecture06
//
//  Created by Manarbek Bibit on 09.04.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @State var progress: Double = 0.5
    
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(cgColor: CGColor(red: 0.02, green: 0.647, blue: 0.937, alpha: 1))]
    }
    let gradient = Gradient(colors: [Color(.sRGB, red: 0.833, green: 0.882, blue: 0.972, opacity: 1), .white])
    
    let today = Date()
    let calendar = Calendar.current
    let formatter = DateFormatter()
    @EnvironmentObject var waterBalanceModel: WaterBalanceModel
       
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                        )
                        .frame(height: 332)
                    VStack{
                        ZStack {
                            Rectangle()
                                .frame(width: 165, height: 95)
                                .foregroundColor(Color(CGColor(red: 0.454, green: 0.761, blue: 0.935, alpha: 0)))
                                .overlay(WaveShapeBack().fill(Color(CGColor(red: 0.454, green: 0.761, blue: 0.935, alpha: 1))))
                                .padding(.top, 76)
                            Rectangle()
                                .frame(width: 150, height: 75)
                                .foregroundColor(Color(CGColor(red: 0.454, green: 0.761, blue: 0.935, alpha: 0)))
                                .overlay(WaveShape().fill(Color(CGColor(red: 0.094, green: 0.669, blue: 0.992, alpha: 1))))
                                .padding(.top, 106)
                            
                            Circle()
                                .stroke(.white, lineWidth: 4)
                                .frame(width: 180, height: 180)
                            VStack{
                                Text("20%")
                                    .font(.custom("SF-Pro-Display-Bold", size: 36))
                                Text("0,5 out of \(waterBalanceModel.getDailyIntake)")
                                    .font(.custom("SF-Pro-Display-Medium", size: 16))
                            }
                        }
                        .padding(.top, 32)
                        Text("\(weekdayName(today)), \(formattedDate(today))")
                            .font(.custom("SF-Pro-Text-Regular", size: 17))
                            .padding(.top, 58)
                    }
                }
                .padding(.top, 30)
                
                Text("Add your first drink for today")
                    .font(.custom("SF-Pro-Display-Semibold", size: 36))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(CGColor(red: 0.185, green: 0.183, blue: 0.201, alpha: 1)))
                    .padding(.top, 20)
                Spacer()
                NavigationLink {
                    DailyIntakeScreenView().navigationBarBackButtonHidden(true)
                } label: {
                    CustomButton(name: "Add")
                        .padding(.bottom, 107)
                }

            }
            .onAppear{
                withAnimation(.default) {
                    waterBalanceModel.isShowTabView = true
                }
            }
            .padding(.top, 80)
            .padding(.horizontal, 16)
            .background(Color(CGColor(red: 0.988, green: 0.992, blue: 1, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("WATER BALANCE").font(.custom("SF-Pro-Display-BlackItalic", size: 17))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func weekdayName(_ date: Date) -> String {
        let weekday = calendar.component(.weekday, from: date)
        return calendar.weekdaySymbols[weekday - 1]
    }
    
    func formattedDate(_ date: Date) -> String {
            formatter.dateFormat = "d'\(daySuffix(date)) of' MMMM"
            return formatter.string(from: date)
        }
        
    func daySuffix(_ date: Date) -> String {
            let calendar = Calendar.current
            let dayOfMonth = calendar.component(.day, from: date)
            switch dayOfMonth {
            case 1, 21, 31:
                return "st"
            case 2, 22:
                return "nd"
            case 3, 23:
                return "rd"
            default:
                return "th"
            }
        }
}

struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        path.addCurve(to: CGPoint(x: rect.width / 2, y: rect.height / 3),
                      control1: CGPoint(x: rect.width * 0.25, y: rect.height * 0.4),
                      control2: CGPoint(x: rect.width * 0.35, y: rect.height * 0.15))
        path.addCurve(to: CGPoint(x: 155, y: rect.height / 3),
                      control1: CGPoint(x: rect.width * 0.75, y: rect.height * 0.7),
                      control2: CGPoint(x: rect.width * 0.85, y: rect.height * 0.5))
        path.addLine(to: CGPoint(x: 116, y: 67))
        path.addLine(to: CGPoint(x: 58, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct WaveShapeBack: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        path.addCurve(to: CGPoint(x: rect.width / 2, y: rect.height / 2),
                      control1: CGPoint(x: rect.width * 0.25, y: rect.height * 0.6),
                      control2: CGPoint(x: rect.width * 0.35, y: rect.height * 0.5))
        path.addCurve(to: CGPoint(x: 164, y: rect.height / 2),
                      control1: CGPoint(x: rect.width * 0.85, y: rect.height * 0.45),
                      control2: CGPoint(x: rect.width * 0.95, y: rect.height * 0.5))
        path.addLine(to: CGPoint(x: 146, y: 67))
        path.addLine(to: CGPoint(x: 47, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
struct PathAnimation: View {
    @State private var pathProgress = 0.0
    var body: some View {
        VStack {
            WaveShapeBack()
                .trim(from: 0.0, to: pathProgress)
                .stroke(Color.orange, lineWidth: 10)
                .frame(width: 200, height: 200)
                .animation(.easeInOut(duration: 10), value: pathProgress)
            Slider(value: $pathProgress, in: 0.0...1.0)
                .padding()
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .environment(\.locale, Locale(identifier: "USA"))
            .environmentObject(WaterBalanceModel())
    }
}
