//
//  CityName.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 13/07/21.
//

import SwiftUI

struct CityName: View {
    var city:String
    var date:String
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                Text(city)
                    .font(.title)
                    .bold()
                
                Text(date)
                
            }.foregroundColor(.white)
            
        }
        
    }
}

struct CityName_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
