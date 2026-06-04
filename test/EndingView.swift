//
//  EndingView.swift
//  test
//
//  Created by Averina on 03/06/26.
//

import SwiftUI

struct EndingView: View {
	@State private var isVisible: Bool = false
	var body: some View {
		ZStack {
			Image(.endingBG)
				.resizable()
				.ignoresSafeArea()
				.scaledToFill()
			Image(.teacherEnding)
				.position(x: 160, y: 230)
			VStack {
				Text("You can always say:")
					.bold()
					.font(.title)
				Text("Yes.")
					.opacity(isVisible ? 1 : 0)
				Text("No.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
//					.animation(
//						.easeOut(duration: 0.5),
//						value: isVisible
//					)
					.onTapGesture {
						isVisible = true
					}
					.font(.title)

				Text("Stop.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(6.0),
						value: isVisible
					)
					.onAppear {
						isVisible = true
					}
					.font(.title)

				Text("I don't like that.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(9.0),
						value: isVisible
					)
					.onAppear {
						isVisible = true
					}
					.font(.title)

			}
			.foregroundStyle(Color.white)
			.position(x: 520, y: 200)
		}
	}
}

#Preview {
	EndingView()
}
