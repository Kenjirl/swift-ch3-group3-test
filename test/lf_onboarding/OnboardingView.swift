//
//  OnboardingView.swift
//  test
//
//  Created by Calogero Friscia on 02/06/26.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var rotateBack:CGFloat = 0
    
    var body: some View {
        
        ZStack(alignment:.bottom) {
            
            Image("onboarding_sky")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            CloudCartView(h: 65, opacity: 0.9)
                 .offset(x: -300, y: -250)
            
            CloudCartView(h: 45, opacity: 0.6)
                 .offset(x: -400, y: -100)
            
            CloudCartView(h: 55, opacity: 0.4)
                 .offset(x: 300, y: -50)
            
            CloudCartView(h: 45, opacity: 0.6)
                 .offset(x: 100, y: -150)
            
            CircleBoarding()

              
            VStack(spacing:10) {
                
                Text("Games")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                
                Text("[Game Name]")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                  
                
                Spacer()
                 

            }
            .padding(.top,50)
        }
        .onAppear {
           // AudioManager.shared.playAudioEffect(.mainSound)
        }
        
    }
}

//#Preview {
//   // OnboardingView()
//    CircleBoarding()
//}

#Preview {
    OnboardingView()
  //  CircleBoarding()
}

import Combine

struct CloudCartView:View {
    
    let h:CGFloat
    let opacity:CGFloat
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()
    
    @State private var offsetX:CGFloat = 0
    
    var body: some View {
        
        Image("onboarding_cloud")
            .resizable()
            .scaledToFit()
            .opacity(opacity)
            .frame(height: h)
            .offset(x:offsetX)
            .onReceive(timer) { value in
  
            withAnimation(.linear(duration: 1.0)) {
                
                offsetX += 5
            }
            
        }
        
    }
}

struct CircleBoarding:View {
    
    @State private var rotate:CGFloat = 0
    
    var body: some View {
        
        GeometryReader { geo in
            
            Image("onboarding_back_circle")
                .resizable()
                .scaledToFill()
                .rotationEffect(.degrees(rotate))
                .animation(.easeOut(duration: 1.2), value: rotate)
                .position(x:geo.size.width / 2,y:geo.size.height * 1.70)
                .onTapGesture {
                    rotate -= 180
                }
        }
    }
}
