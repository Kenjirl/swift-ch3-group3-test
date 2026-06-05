//
//  Quiz2.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 03/06/26.
//

import SwiftUI

struct Quiz2: View {

    let onComplete: () -> Void

    let actions = [
        "Grab it",
        "Ask it",
        "Hide it"
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

            VStack(spacing: 25) {
                QuizTitle(
                    text: "Choose The Best Action"
                )
                
                Image("crayon")
                
                VStack {
                    Text("You want to borrow some crayons from your friend.")
                    
                    Text("What should you do?")
                }
                .font(.custom("Fredoka", size: 22))

                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            buttonTapped(number)
                        } label: {
                            ZStack {
                                Image("quiz-button")
                                    .resizable()
                                    .frame(width: 200, height: 70)
                                Text(actions[number])
                                    .font(.custom( "Fredoka", size: 20)
                                    )
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 15)
                            }
                        }
                    }
                }
            }
            
            if let feedbackImageName,
               showingFeedback {
                FeedbackOverlay(
                    imageName: feedbackImageName
                )
            }
        }
    }

    func buttonTapped(_ number: Int) {
        let isCorrect = number == 1
        feedbackImageName = isCorrect ? "correct" : "tryAgain"
        showingFeedback = true
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 1
        ) {
            showingFeedback = false
            if isCorrect {
                onComplete()
            }
        }
    }
}

#Preview {
    Quiz2(onComplete: {})
}
