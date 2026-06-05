//
//  AssetCharacter.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI
import Lottie
 
struct AssetCharacter: View {
    let asset: AssetModel
    let isActive: Bool
    let animationTrigger: String
    let geometrySize: CGSize
    
    let lottiePropName = " lottie"
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    @State private var phase: AnimationPhase = .idle
    
    enum AnimationPhase {
        case idle, forward, reverse
    }
    
    var playbackMode: LottiePlaybackMode {
        switch phase {
            case .idle:    return .paused(at: .progress(0))
            case .forward: return .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
            case .reverse: return .playing(.fromProgress(1, toProgress: 0, loopMode: .playOnce))
        }
    }
    
    var body: some View {
        if reduceMotion || !asset.animateAble {
            /// Common Asset

            let animatedView =
                Image(asset.source)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: geometrySize.width * asset.size.width,
                        height: geometrySize.height * asset.size.height
                    )
            
            if reduceMotion && asset.type != .other {
                animatedView
                    .keyframeAnimator(initialValue: CGFloat(0), trigger: animationTrigger) { view, offset in
                        view.offset(y: isActive ? offset : 0)
                    } keyframes: { _ in
                        CubicKeyframe(0, duration: 0.1)
                        CubicKeyframe(-20, duration: 0.15)
                        CubicKeyframe(0, duration: 0.15)
                        CubicKeyframe(-20, duration: 0.15)
                        CubicKeyframe(0, duration: 0.15)
                    }
                    .position(
                        x: geometrySize.width * asset.position.x,
                        y: geometrySize.height * asset.position.y
                    )
            } else {
                animatedView
                    .position(
                        x: geometrySize.width * asset.position.x,
                        y: geometrySize.height * asset.position.y
                    )
            }
        } else {
            /// Lottie Asset

            LottieView {
                try await DotLottieFile.named(asset.source+lottiePropName)
            }
            .playbackMode(playbackMode)
            .animationDidFinish { _ in
                phase = .idle
            }
            .onTapGesture {
                guard phase == .idle else { return }
                phase = .forward
            }
            .position(
                x: geometrySize.width * asset.position.x,
                y: geometrySize.height * asset.position.y
            )
        }
    }
}
