//
//  OnboardingView.swift
//  test
//
//  Created by Calogero Friscia on 02/06/26.
//

import SwiftUI

struct OnboardingView: View {
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
            
            Image("onboarding_back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
              
          
            
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
            .padding(.vertical,50)
        }
        .onAppear {
            AudioManager.shared.playAudioEffect(.mainSound)
        }
        
    }
}

#Preview {
    OnboardingView()
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
