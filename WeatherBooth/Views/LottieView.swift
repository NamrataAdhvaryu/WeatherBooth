//
//  LottieView.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 13/07/21.
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    var name:String
    var loopmode:LottieLoopMode = .loop
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        uiView.subviews.forEach({$0.removeFromSuperview()})
        
        let animationview = AnimationView()
        animationview.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationview)
        
        NSLayoutConstraint.activate([
            
            animationview.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationview.heightAnchor.constraint(equalTo: uiView.heightAnchor)
            
        ])
        
        animationview.animation = Animation.named(name)
        animationview.contentMode = .scaleAspectFit
        animationview.loopMode = loopmode
        animationview.play()
    }
}
