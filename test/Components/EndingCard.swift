//
//  EndingCard.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 29/05/26.
//

import SwiftUI

struct EndingCard: View {
    let ending: EndingModel
    let onHome: () -> Void
    let onRestart: () -> Void
    let onProceed: () -> Void
    let hasNext: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
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
                            
                            Text("Lesson Learned")
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
                                Image(systemName: "house.fill")
                                    .frame(width: 50, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(50)
                                    .foregroundColor(Color(ending.colorName))
                                    .font(.title2)
                            }
                            
                            // Restart Button
                            Button {
                                onRestart()
                            } label: {
                                Image(systemName: "arrow.trianglehead.counterclockwise")
                                    .frame(width: 50, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(50)
                                    .foregroundColor(Color(ending.colorName))
                                    .font(.title2)
                            }
                            
                            // Proceed Button
                            if hasNext {
                                Button {
                                    onProceed()
                                } label: {
                                    Image(systemName: "forward.fill")
                                        .frame(width: 50, height: 50)
                                        .background(Color.white)
                                        .cornerRadius(50)
                                        .foregroundColor(Color(ending.colorName))
                                        .font(.title2)
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
}

#Preview {
    @Previewable let story: StoryModel = StoryData.stories[0]
    EndingCard(
        ending: story.scenes[4].ending!,
        onHome: {},
        onRestart: {},
        onProceed: {},
        hasNext: true
    )
}
