//
//  Quiz3.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 04/06/26.
//

import SwiftUI

struct Quiz3: View {

    let onComplete: () -> Void
    
    let actions = [
        "Stop asking",
        "Keep asking"
    ]
    
    @State private var feedbackImageName: String?
    @State private var showingFeedback = false

    var body: some View {

        ZStack {
            Color(
                red: 141/255,
                green: 193/255,
                blue: 246/255
            )
            .ignoresSafeArea()

            VStack(spacing:25) {
                QuizTitle(
                    text: "Stop or Go"
                )
                
                Text("Your friend said \"NO\"")
                    .font(.custom("Fredoka", size: 22))
                
                Image("No Gesture")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    ForEach(0..<2) { number in
                        Button {
                            actionTapped(number)
                        } label: {
                            ZStack {
                                Image("quiz-button")
                                    .resizable()
                                    .frame(width: 200, height: 70)
                                Text(actions[number])
                                    .font(.custom("Fredoka",size: 20))
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 15)
                            }
                        }
                    }
                }
                
//                Button("Finish Game") {
//                    onComplete()
//                }
            }
            
            if let feedbackImageName,
               showingFeedback {
                FeedbackOverlay(imageName: feedbackImageName)
            }
        }
    }
    
    func actionTapped(_ number: Int) {
        let isCorrect = number == 0
        feedbackImageName = isCorrect ? "correct" : "tryAgain"
        showingFeedback = true
        DispatchQueue.main.asyncAfter( deadline: .now() + 1) {
            showingFeedback = false
            if isCorrect {
                onComplete()
            }
        }
    }
}

#Preview {
    Quiz3(onComplete: {})
}
