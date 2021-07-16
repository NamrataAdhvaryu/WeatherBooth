//
//  GADBannerView.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 13/07/21.
//

import SwiftUI

struct GADBannerView: View {
    var body: some View {
        func makeUIViewController(context: Context) -> some View {
          let view = GADBannerView(adSize: kGADAdSizeBanner)
          let viewController = UIViewController()
          let testID = "ca-app-pub-3940256099942544/2934735716"
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
        
      }

    }
}

struct GADBannerView_Previews: PreviewProvider {
    static var previews: some View {
        
        GADBannerView()
    }
}
