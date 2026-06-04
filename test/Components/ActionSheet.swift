//
//  ActionSheet.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI
 
struct ActionSheet: View {
    let actions: [ActionModel]
    let onSelect: (ActionModel) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 10) {
                Text("What will you do?")
                    .foregroundColor(Color.accentGreen)
                    .fontWeight(.semibold)
                    .font(.custom("Fredoka", size: 24))
                    .padding(.top, 30)
                
                HStack(spacing: 8) {
                    ForEach(actions) { action in
                        Button {
                            onSelect(action)
                        } label: {
                            Text(action.text)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .padding(.bottom)
                                .background(
                                    Image("btn action")
                                        .resizable()
                                        .scaledToFit()
                                )
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.custom("Fredoka", size: 16))
                        }
                    }
                }
                .padding(.horizontal, 30)
                .frame(width: 400)
            }
            .background(
                Color.white
                    .cornerRadius(20)
            )
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .transition(.move(edge: .bottom))
        .ignoresSafeArea()
    }
}

#Preview {
    ActionSheet(actions: [.init(text: "Action 1", nextScene: 0), .init(text: "Action 2", nextScene: 1)], onSelect: { _ in })
}
