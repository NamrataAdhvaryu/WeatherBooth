//
//  ContentView.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 12/07/21.
//

import SwiftUI
import GoogleMobileAds

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    @State private var isSettingPresented = false
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottom) {
                
                VStack(spacing: 0) {
                    
                    MenuHeaderView(cityVM: cityVM).padding()
                    
                    settingButton.foregroundColor(.white)
                    ScrollView(showsIndicators: false) {
                        
                        // GADBannerViewController()
                        CityView(cityVM: cityVM)
                    }.padding(.top, 10)
                    
                }.padding(.top, 40)
                
            }.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5407095551, green: 0.7623606324, blue: 0.975662291, alpha: 1)), Color(#colorLiteral(red: 0.4177498519, green: 0.5340259075, blue: 0.9375404716, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .navigationBarItems(trailing:
                                    settingButton
            ).sheet(isPresented: $isSettingPresented,
                    content: { Rawdata(viewModel: WeatherViewModel.init()) })
            
        }
        
        
    }
    
    private var settingButton: some View {
        Button(action: {
            self.isSettingPresented = true
        }) {
            HStack {
                Image(systemName: "globe").imageScale(.medium)
            }.frame(width: 10, height: 10)
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GADBannerViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        let viewController = UIViewController()
        //    let testID = "ca-app-pub-3940256099942544/2934735716"
        let realID = "ca-app-pub-9450475706334809/7473547174"
        
        // Banner Ad
        view.adUnitID = realID
        view.rootViewController = viewController
        
        // View Controller
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        
        // Load an ad
        view.load(GADRequest())
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillDIsmissScreen")
    }
}


