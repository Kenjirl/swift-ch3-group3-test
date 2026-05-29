//
//  LoadingKiwiView.swift
//  test
//
//  Created by Calogero Friscia on 29/05/26.
//

import SwiftUI
import Combine

struct LoadingKiwiView: View {

    let timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @State private var angle: CGFloat = 0

    private var scale: CGFloat { horizontalSizeClass == .regular ? 1.8 : 1.0 }

    private var activeStep: Int {
        Int(angle.truncatingRemainder(dividingBy: 360) / 90)
    }

    var body: some View {

        ZStack {

            GradientColor.gameBackground
                .ignoresSafeArea()

            VStack(spacing: 20 * scale) {

                ZStack {
                    Image("kiwi_shape")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150 * scale, height: 150 * scale)
                    Image("kiwi_center")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100 * scale, height: 100 * scale)
                        .shadow(color: .gray, radius: 1, x: 0, y: 4)
                        .rotationEffect(.degrees(angle))
                        .animation(.linear(duration: 0.1), value: angle)
                }

                HStack(spacing: 8 * scale) {
                    ForEach(0..<4, id: \.self) { i in
                        Circle()
                            .fill(Color.secondary)
                            .frame(width: 10 * scale, height: 10 * scale)
                            .scaleEffect(activeStep == i ? 1.4 : 1.0)
                            .opacity(activeStep == i ? 1.0 : 0.35)
                            .animation(.easeInOut(duration: 0.3), value: activeStep)
                    }
                }

            }

        }
        .onReceive(timer) { _ in
            angle += 10.0
        }

    }
}

#Preview {
    LoadingKiwiView()
}
