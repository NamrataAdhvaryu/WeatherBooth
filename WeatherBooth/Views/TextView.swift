//
//  TextView.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import SwiftUI

struct TextView: View {
    @ObservedObject var cityVM: CityViewViewModel
   
    var body: some View {
        HStack {
            cityVM.image
                        .resizable()
                        .frame(width: 50, height: 50)
            Text(cityVM.city)

                    Spacer()
                }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(cityVM: CityName[0])
    }
}
