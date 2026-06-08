//
//  EndingCard.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 29/05/26.
//

import SwiftUI

struct EndingCard: View {
	@EnvironmentObject var vm:ViewModel
	
    let ending: EndingModel
    let onHome: () -> Void
    let onRestart: () -> Void
    let onProceed: () -> Void
    let hasNext: Bool
    
    @AppStorage("currentSceneIndex") var currentSceneIndex: Int = 0
    @AppStorage("currentDialogIndex") var currentDialogIndex: Int = 0
    @AppStorage("checkpoint") var checkpoint: Int = 0
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    // Card
                    VStack(spacing: 24) {
                        // Stars
                        HStack(spacing: 20) {
                            Image("prop bulb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text(hasNext ? "Lesson Learned" : "Story Clear")
                                .font(.custom("Fredoka", size: 24))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .bold()
                            
                            Image("prop bulb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                        }
                        .frame(maxWidth: .infinity)
                        
                        // Text
                        Text(ending.text)
                            .font(.custom("Fredoka", size: 24))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .fontWeight(.semibold)
    
                        // Button Bar
                        HStack {
                            // Home button
                            Button {
                                onHome()
                            } label: {
                                Image("btn home")
                                    .frame(width: 50, height: 50)
                            }
                            
                            // Proceed Button
                            if hasNext {
                                Button {
                                    onProceed()
                                } label: {
                                    Image("btn next")
                                        .frame(width: 50, height: 50)
                                }
							} else {
								Button {
									goToEnding()
								} label: {
                                    Image("btn check")
                                        .frame(width: 50, height: 50)
								}
							}
                        }
                    }
                    .padding(24)
                }
                .frame(maxWidth: 600)
                .background(
                    Image(ending.background)
                        .resizable()
                        .scaledToFill()
                )
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
        }
    }
	
	func goToEnding() {
        vm.moveScreenState(to: .ending)
        checkpoint = 0
        currentSceneIndex = 0
        currentDialogIndex = 0
	}
}

#Preview {
    @Previewable let story: StoryModel = StoryData.storie_1(player: .female)
    EndingCard(
        ending: story.scenes[4].ending!,
        onHome: {},
        onRestart: {},
        onProceed: {},
        hasNext: true
    )
}
