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
		ZStack{
			Image(.endingBG)
				.resizable()
				.ignoresSafeArea()
				.scaledToFill()
			Image(.teacherEnding)
				.position(x: 160, y: 230)
			VStack{
				Text("You can always say:")
					.bold()
				Text("No.")
				.opacity(isVisible ? 1 : 0) // Controls the opacity
							.scaleEffect(isVisible ? 1 : 0.8)
							// Triggers the animation automatically on appear
							.animation(.easeOut(duration: 0.5).delay(3.0), value: isVisible)
							.onAppear {
								isVisible = true
							}
				
				
				Text("Stop.")
				Text("I don't like that.")
			}
			.foregroundStyle(Color.white)
		}
	}
}

#Preview {
	EndingView()
}
