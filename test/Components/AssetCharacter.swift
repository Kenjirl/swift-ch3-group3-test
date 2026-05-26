//
//  AssetCharacter.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI
 
struct AssetCharacter: View {
    let asset: AssetModel
    let isActive: Bool
    let animationTrigger: String
    let geometrySize: CGSize
    
    var body: some View {
        let animatedView = Image(asset.source)
            .resizable()
            .scaledToFit()
            .frame(
                width: geometrySize.width * asset.size.width,
                height: geometrySize.height * asset.size.height
            )

        if asset.type != .other {
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
    }
}
