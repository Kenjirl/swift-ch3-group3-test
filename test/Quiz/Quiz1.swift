//
//  Quiz.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 03/06/26.
//

import SwiftUI

struct Quiz1: View {

    let onComplete: () -> Void

    @State private var expressions =
        ["Sad", "Happy", "Shock"].shuffled()

    @State private var correctAnswer =
        Int.random(in: 0...2)

    @State private var feedbackImageName: String?
    @State private var showingFeedback = false

    @State private var score = 0

    var body: some View {

        ZStack {
            Color(
                red: 141/255,
                green: 193/255,
                blue: 246/255
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                QuizTitle(text: "Emotion Detection")
                
                Text("Question \(score + 1)/5")
                    .font(.custom("Fredoka", size: 22))
                    .foregroundStyle(.white)

                Text(expressions[correctAnswer])
                    .font(.custom("Fredoka", size: 25))

                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            emotionTapped(number)
                        } label: {
                            FacesExpression(expression: expressions[number])
                        }
                    }
                    .padding()
                    
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

    func emotionTapped(_ number: Int) {
        let isCorrect = number == correctAnswer
        feedbackImageName = isCorrect ? "correct" : "tryAgain"
        showingFeedback = true
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 1
        ) {
            showingFeedback = false
            if isCorrect {
                score += 1
                if score > 4 {
                    onComplete()
                } else {
                    askQuestion()
                }
            } else {
                askQuestion()
            }
        }
    }

    func askQuestion() {
        expressions.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    Quiz1(onComplete: {})
}
