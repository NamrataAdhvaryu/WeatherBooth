//
//  WeatherDetailView.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import SwiftUI

struct WeatheDetailView: View {
    @State var daily: PresentableDailyy
    
    var body: some View {
        VStack {
            Text(daily.dateString).bold().padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color.blue.opacity(0.5), alignment: .center)
            
            HStack(spacing: 5.0) {
                Text(WeatherConstant.Strings.description).bold()
                Text(daily.weatherDescription)
            }
            HStack {
                HStack(spacing: 5.0) {
                    Text(WeatherConstant.Strings.temperature).bold()
                    Text("\(daily.minTempWithUnits)")
                }
                HStack(spacing: 5.0) {
                    Text(WeatherConstant.Strings.wind).bold()
                    Text(String(format: "%0.0f m / s", daily.wind ))
                }
            }
        }
        .background(Color.clear, alignment: .leading)
    }
}


