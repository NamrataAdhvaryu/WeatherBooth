//
//  WeatherCell.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//
import SwiftUI

struct WeatherCell: View {
    
    @State var daily: PresentableDailyy
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            HStack {
                HStack(spacing: 5.0) {
                    Text(WeatherConstant.Strings.temperature).bold()
                    Text(String(format: "%0.0f L - %0.0f H", daily.minTempWithUnits, daily.maxTempWithUnits ))
                }
                Spacer()
                HStack(spacing: 5.0) {
                    Text(WeatherConstant.Strings.wind).bold()
                    Text(String(format: "%0.0f m/s", daily.wind ))
                }
            }
            Spacer()
            HStack(spacing: 10) {
                HStack(spacing: 5.0) {
                    Text(WeatherConstant.Strings.description).bold()
                    Text(daily.weatherDescription)
                }
                Spacer()
                HStack() {
                    Text(daily.dateString).bold()
                }.background(Color.blue.opacity(0.5), alignment: .center)
            }
            Spacer()
        }
        .background(Color.clear, alignment: .leading)
    }
}

