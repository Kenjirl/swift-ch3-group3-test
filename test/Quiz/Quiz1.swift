//
//  Quiz.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 03/06/26.
//

import SwiftUI

struct FacesExpression: View {
    let expression: String
    
    var body: some View {
        Image(expression)
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .offset(x:20)
            
    }
}

struct Quiz1: View {
    @State private var expressions = ["Sad", "Happy", "Shock"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var messageTitle = ""
    @State private var message = ""
    
    @State private var showingMessage = false
    @State private var feedbackImageName: String? = nil
    
    var body: some View {
        ZStack {
            Color(red: 141/255, green: 193/255, blue: 246/255)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("Emotion Detection")
                    .bold()
                    .font(.custom("Fredoka", size: 30))
                    .foregroundStyle(Color.white)
                
                Text(expressions[correctAnswer])
                    .font(.custom("Fredoka", size: 25))
                    .padding(.bottom, 30)
                
//                Spacer()
                
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            // emotion was tapped
                            emotionTapped(number)
                        } label: {
                            FacesExpression(expression:expressions[number])
                        }
                        Spacer()
                    }
                }
            }
            .padding(50)
            
            if let feedbackImageName, showingMessage {
                VStack {
                    Color.black.opacity(0.001) // keep interaction layer
                        .ignoresSafeArea()
                    Image(feedbackImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            }
            
//            .alert(messageTitle, isPresented: $showingMessage) {
//                Button("Continue", action: reset)
//            } message: {
//                Text("Continue")
//            }
//            .padding(50)
        }
    }
    
    func emotionTapped(_ number: Int) {
        if number == correctAnswer {
            messageTitle = "Correct!"
            message = "Your are very smart"
        } else {
            messageTitle = "Wrong!"
            message = "That is \(expressions[number])"
        }
        
        feedbackImageName = (number == correctAnswer) ? "correct" : "tryAgain"
        showingMessage = true
        
        // Auto-hide feedback and move to next question
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            showingMessage = false
            feedbackImageName = nil
            askQuestion()
        }
    }
    
    func askQuestion() {
        expressions.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        askQuestion()
    }
}

#Preview {
    Quiz1()
}
