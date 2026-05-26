//
//  DialogBubble.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI
 
struct DialogBubble: View {
    let dialog: DialogModel
    let width: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            RoundedTriangle()
                .fill(Color.white)
                .frame(width: 16, height: 16)
                .opacity(dialog.type == .player ? 1 : 0)
            
            Text(dialog.text)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .frame(width: width)
                .background(Color.white)
                .cornerRadius(12)
                .font(.custom("Fredoka", size: 20))
            
            RoundedTriangle()
                .fill(Color.white)
                .frame(width: 16, height: 16)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .opacity(dialog.type == .npc ? 1 : 0)
        }
    }
}
