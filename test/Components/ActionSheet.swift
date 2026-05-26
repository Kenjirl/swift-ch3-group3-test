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
            
            VStack(spacing: 12) {
                Text("What will you do?")
                    .bold()
                    .foregroundColor(.gray)
                
                HStack(spacing: 8) {
                    ForEach(actions) { action in
                        Button {
                            onSelect(action)
                        } label: {
                            Text(action.text)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(Color(red: 255/255, green: 154/255, blue: 134/255))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                .contentShape(Rectangle())
                                .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 4)
                        }
                    }
                }
            }
            .padding(20)
            .padding(.bottom, 40)
            .background(
                Color.white
                    .cornerRadius(20)
            )
        }
        .frame(maxWidth: .infinity)
        .transition(.move(edge: .bottom))
        .font(.custom("Fredoka", size: 20))
    }
}
