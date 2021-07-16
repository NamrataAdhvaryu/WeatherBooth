//
//  MenuHeaderView.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 13/07/21.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    @State private var searchterm = "Montreal"
    
    var body: some View {
        HStack {
            TextField("", text: $searchterm)
                .padding(.leading,20)
            
            Button {
                cityVM.city = searchterm
            } label: {
                ZStack {
                    RoundedRectangle (cornerRadius: 10)
                        .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading)  {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
