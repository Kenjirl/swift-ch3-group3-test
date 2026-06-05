//
//  QuizView.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 04/06/26.
//

import Lottie
import SwiftUI

struct QuizView: View {
	@EnvironmentObject var vm: ViewModel
    @State private var phase: AnimationPhase = .idle
    @State private var currentStep: QuizStep = .quiz1

    enum AnimationPhase {
        case idle, forward, reverse
    }

    var playbackMode: LottiePlaybackMode {
        switch phase {
        case .idle: return .paused(at: .progress(0))
        case .forward:
            return .playing(
                .fromProgress(0, toProgress: 1, loopMode: .playOnce)
            )
        case .reverse:
            return .playing(
                .fromProgress(1, toProgress: 0, loopMode: .playOnce)
            )
        }
    }

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
                    red: 141 / 255,
                    green: 193 / 255,
                    blue: 246 / 255
                )
                .ignoresSafeArea()

                VStack {
//                    Text("🎉")
//                        .font(.system(size: 80))

                    Text("Congratulations!")
                        .font(
                            .custom(
                                "Fredoka",
                                size: 36
                            )
                        )
                        .foregroundStyle(.white)
                    LottieView {
                        try await DotLottieFile.named("starGoodJob")
                    }
                    .playbackMode(playbackMode)
                    .animationDidFinish { completed in
                        guard completed else { return }
                        switch phase {
                        case .forward:
                            phase = .reverse
//                            DispatchQueue.main.asyncAfter(
//                                deadline: .now() + 0.05
//                            ) {
//                                phase = .reverse
//                            }
                        case .reverse:
                            phase = .forward
                        case .idle:
                            break
                        }
                    }
                    .onAppear{
                        phase = .forward
                    }
//                    .onTapGesture {
//                        guard phase == .idle else { return }
//                        phase = .forward
//                    }
                }
				
            }
			.onTapGesture {
				vm.moveScreenState(to: .menu)
			}
        }
    }
}

#Preview {
    QuizView()
}
