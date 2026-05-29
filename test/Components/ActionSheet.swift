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
    
    @State private var showTitle: Bool = false
    @State private var showButtons: Bool = false
    
    var body: some View {
        VStack {
            if showTitle {
                Text("What will you do?")
                    .bold()
                    .font(.custom("Fredoka", size: 28))
                    .foregroundStyle(Color.accentBlue)
                    .shadow(color: .white.opacity(0.8), radius: 5, x: 0, y: 0)
                    .transition(.move(edge: .top))
            }
            
            Spacer()
            
            if showButtons {
                HStack(spacing: 8) {
                    ForEach(actions) { action in
                        Button {
                            onSelect(action)
                        } label: {
                            Text(action.text)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(Color.accentPink)
                                .foregroundColor(.white)
                                .shadow(color: .white.opacity(0.8), radius: 5, x: 0, y: 0)
                                .fontWeight(.semibold)
                                .cornerRadius(50)
                                .contentShape(Rectangle())
                                .shadow(color: .accentPink.opacity(0.8), radius: 5, x: 0, y: 4)
                        }
                    }
                }
                .font(.custom("Fredoka", size: 20))
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 24)
        .padding(.bottom, 48)
        .onAppear {
            withAnimation(.spring()) {
                showTitle = true
                showButtons = true
            }
        }
    }
}

#Preview {
    ActionSheet(actions: [.init(text: "Action 1", nextScene: 0), .init(text: "Action 2", nextScene: 1)], onSelect: { _ in })
}
