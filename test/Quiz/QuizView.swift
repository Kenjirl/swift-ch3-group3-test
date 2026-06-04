//
//  QuizView.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 04/06/26.
//

import SwiftUI

struct QuizView: View {

    @State private var currentStep: QuizStep = .quiz1

    var body: some View {

        switch currentStep {

        case .quiz1:
            Quiz1 {
                currentStep = .quiz2
            }
        case .quiz2:
            Quiz2 {
                currentStep = .quiz3
            }
        case .quiz3:
            Quiz3 {
                currentStep = .finished
            }
        case .finished:

            ZStack {
                Color(
                    red: 141/255,
                    green: 193/255,
                    blue: 246/255
                )
                .ignoresSafeArea()

                VStack {
                    Text("🎉")
                        .font(.system(size: 80))

                    Text("Congratulations!")
                        .font(
                            .custom(
                                "Fredoka",
                                size: 36
                            )
                        )
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

//#Preview {
//    QuizView(currentStep: .quiz1)
//}
