//
//  WeatherCell.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 14/07/21.
//

import SwiftUI

struct WeatherCell: View {
    @State var daily: DailyWeather
    @Binding var needsRefresh: Bool
    var body: some View {

                VStack(spacing: 8) {
                    Spacer()
                    HStack {
                        HStack(spacing: 5.0) {
                            Text(daily.temp)
                            
                        }
                        Spacer()
                        HStack(spacing: 5.0) {
                            Text(daily.temp)
                            
                        }
                    }
                    Spacer()
                    HStack(spacing: 10) {
                        HStack(spacing: 5.0) {
                            Text(daily.weather.description)
                            
                        }
                        Spacer()
                        HStack() {
                            Text(daily.temp)
                        }.background(Color.blue.opacity(0.5), alignment: .center)
                    }
                    Spacer()
                }
                .background(Color.clear, alignment: .leading)
            }
        }




struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(daily: DailyWeather, needsRefresh: <#Binding<Bool>#>)
    }
}
