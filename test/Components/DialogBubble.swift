//
//  DialogBubble.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI
 
struct DialogBubble: View {
    let dialog: DialogModel
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                // Dialog Card
                HStack{
                    Text(dialog.text)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(20)
                        .frame(width: 220)
                        .background(Color(dialog.colorName))
                        .cornerRadius(10)
                        .font(.custom("Fredoka", size: 24))
                        .foregroundStyle(Color.white)
                        .fontWeight(.medium)
                }
                .padding(4)
                .background(Color.white)
                .cornerRadius(12)
                
                // Arrow Left
                ZStack {
                    RoundedTriangle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                        .opacity(dialog.arrowDirection == .left ? 1 : 0)
                    RoundedTriangle(cornerRadius: 4)
                        .fill(Color(dialog.colorName))
                        .frame(width: 30, height: 30)
                        .opacity(dialog.arrowDirection == .left ? 1 : 0)
                        .offset(x:5)
                }
                .offset(x:-130)
                
                // Arrow Right
                ZStack {
                    RoundedTriangle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .opacity(dialog.arrowDirection == .right ? 1 : 0)
                    RoundedTriangle(cornerRadius: 4)
                        .fill(Color(dialog.colorName))
                        .frame(width: 30, height: 30)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .opacity(dialog.arrowDirection == .right ? 1 : 0)
                        .offset(x:-5)
                }
                .offset(x:130)
            }
        }
    }
}

#Preview {
    @Previewable let story: StoryModel = StoryData.storie_1(player: .female)
    DialogBubble(dialog: story.scenes[0].dialogs[1])
}
