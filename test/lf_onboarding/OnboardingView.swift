//
//  OnboardingView.swift
//  test
//
//  Created by Calogero Friscia on 02/06/26.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var vm:ViewModel
    
    @State private var onboardingFace:BoardingFace = .threeAsset
    
    @State private var rotateBack:CGFloat = 0
    @State private var playMusic:Bool = true
    
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
            
            CircleBoarding(onboardingFace: $onboardingFace)
            
            onboardingFace
                .getSceneTitle()
                .frame(width: .infinity, height: 125)
                .padding(.bottom,230)
            
//            Button {
//                playMusic.toggle()
//            } label: {
//                
//                let label = playMusic ? "music.note" : "music.note.slash"
//                
//                Image(systemName: label)
//                    .imageScale(.large)
//                    .foregroundStyle(playMusic ? Color.blue : Color.red)
//            }
//            .buttonStyle(.glass)
//            .offset(x: 300, y: -300)

        }
//        .onAppear {
//            AudioManager.shared.playAudioEffect(.mainSound)
//        }
//        .onChange(of: playMusic) { _, newValue in
//            if newValue {
//                AudioManager.shared.playAudioEffect(.mainSound)
//            } else {
//                AudioManager.shared.stopMusic()
//            }
//        }
        
    }
}

enum BoardingFace {
    
    case threeAsset
    case twoAsset
    
   static func getFace(from angle:CGFloat) -> Self {
        
        if angle.truncatingRemainder(dividingBy: 360) == 0 { return .threeAsset }
        else { return .twoAsset }
    }
    
   @ViewBuilder func getSceneTitle() -> some View {
        
        switch self {
        case .threeAsset:
            // name game asset
            Image("game_name")
                .resizable()
                .scaledToFit()
        case .twoAsset:
            Text("Select your character")
                .font(.largeTitle)
                .fontDesign(.rounded)
                .fontWeight(.black)
                .foregroundStyle(Color.white)
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
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
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
            .animation(reduceMotion ? nil : .linear(duration: 1.0), value: offsetX)
            .onReceive(timer) { _ in
                offsetX += 5
     
            }
        
    }
}

struct CircleBoarding:View {
    
    @EnvironmentObject var vm:ViewModel
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    @Binding var onboardingFace:BoardingFace
    @State private var rotate:CGFloat = 0
  
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment:.bottom) {
                
                Image("onboarding_back_circle")
                    .resizable()
                    .scaledToFill()
                    .rotationEffect(.degrees(rotate))
                    .animation(reduceMotion ? nil : .easeOut(duration: 0.8), value: rotate)
                    .position(x:geo.size.width / 2,y:geo.size.height * 1.72)
                    .gesture(swipe)
                
                if onboardingFace == .twoAsset {
                    
                    HStack(spacing:40) {
                        
                        Button {
                           // vm.moveScreenState(to: .miniGame)
                        } label: {
                            
                            Image("kid_f")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }

                        Button {
                            vm.moveScreenState(to: .menu)
                        } label: {
                            
                            Image("kid_m")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                    .padding(.bottom,80)
                  
    
                }
                
            }

        }
    }
    
    private var swipe: some Gesture {
        
        DragGesture()
            .onChanged { change in
                
               let currentFace = onboardingFace
               
                guard currentFace == .twoAsset else { return }
                
                onboardingFace = .threeAsset
      
                
            }
            .onEnded { value in
                
                Task {
                    if value.startLocation.x > value.predictedEndLocation.x {
                        
                        rotate -= 180
                    } else {
                        rotate += 180
                    }
                    
                    try? await Task.sleep(nanoseconds: 800000000)
                    
                    if reduceMotion {
                        onboardingFace = BoardingFace.getFace(from: rotate)
                    } else {
                        
                        withAnimation {
                            onboardingFace = BoardingFace.getFace(from: rotate)
                        }
                    }
                    
                   
                }
                
                
            }
        
    }
}
