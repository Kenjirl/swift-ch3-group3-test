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
    
    var body: some View {
        ZStack {
            // Card
            VStack(spacing: 24) {
                // Stars
                HStack(spacing: 20) {
                    ForEach(1...3, id: \.self) { index in
                        Image(systemName: index <= ending.star ? "star.fill" : "star")
                            .foregroundColor(index <= ending.star ? .yellow : .white.opacity(0.6))
                            .font(.system(size: 50))
                            .shadow(color: index <= ending.star ? .yellow.opacity(0.8)  : .black.opacity(0), radius: 10, x: 0, y: 0)
                    }
                }
                .frame(maxWidth: .infinity)
                
                // Title
                Text(ending.title)
                    .font(.custom("Fredoka", size: 32))
                    .bold()
                    .foregroundColor(.white)
                
                // Quote text
                Text("\" \(ending.text)\"")
                    .font(.custom("Fredoka", size: 18))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                
                // Home button
                HStack {
                    Button {
                        onHome()
                    } label: {
                        Image(systemName: "arrow.trianglehead.clockwise")
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(50)
                            .foregroundColor(Color(ending.colorName))
                            .font(.title2)
                    }
                    
                    Button {
                        onHome()
                    } label: {
                        Image(systemName: "house")
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(50)
                            .foregroundColor(Color(ending.colorName))
                            .font(.title2)
                    }
                }
            }
            .padding(24)
            .padding(.top, 24)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(ending.colorName))
        )
    }
}

#Preview {
    @Previewable let story: StoryModel = StoryData.stories[0]
    EndingCard(ending: story.scenes[1].ending!, onHome: {})
}
