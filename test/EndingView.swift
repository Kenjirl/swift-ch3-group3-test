//
//  EndingView.swift
//  test
//
//  Created by Averina on 03/06/26.
//

import SwiftUI

struct EndingView: View {
	@EnvironmentObject var vm:ViewModel
	
	//let story: StoryModel
	@State private var currentSceneIndex: Int = 0
	@State private var currentDialogIndex: Int = 0
	
	@State private var isVisible: Bool = false
	@State private var firstText: Bool = true
	@State private var secondText: Bool = false
	@State private var delay: Double = 0.8
	
//	var currentScene: SceneModel {
//		story.scenes[currentSceneIndex]
//	}
//	
//	var currentDialog: DialogModel {
//		currentScene.dialogs[currentDialogIndex]
//	}
	
	
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
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5),
						value: isVisible
					)
					.font(.custom("Fredoka", size: 30))
				Text("No.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(delay),
						value: isVisible
					)
					.font(.custom("Fredoka", size: 30))


				Text("Stop.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(delay * 2),
						value: isVisible
					)
					.font(.custom("Fredoka", size: 30))


				Text("I don't like that.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(delay * 3),
						value: isVisible
					)
					.font(.custom("Fredoka", size: 30))


			}
			.foregroundStyle(Color.white)
			.position(x: 520, y: 200)
			.opacity(firstText ? 1 : 0)
			
			VStack {
				Text("Is someone making you uncomfortable? Tell:")
					.bold()
					.font(.custom("Fredoka", size: 30))
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(delay * 6),
						value: isVisible
					)
					.multilineTextAlignment(.center)
				Text("Mom and Dad.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(delay * 7),
						value: isVisible
					)
					.font(.custom("Fredoka", size: 30))

				Text("Teachers.")
					.opacity(isVisible ? 1 : 0)  // Controls the opacity
					.scaleEffect(isVisible ? 1 : 0.8)
					// Triggers the animation automatically on appear
					.animation(
						.easeOut(duration: 0.5).delay(delay * 8),
						value: isVisible
					)
					.font(.custom("Fredoka", size: 30))

			}
			.foregroundStyle(Color.white)
			.frame(width: 400, height: 200)
			.position(x: 520, y: 200)
			.opacity(secondText ? 1 : 0)
			
			StoryNavigationBar(onHome: goToHome)
			
		}
		.onTapGesture {
			isVisible = true
			DispatchQueue.main.asyncAfter(deadline: .now() + delay * 5) {
				firstText.toggle()
				secondText.toggle()
			}
		}
	}
	
	func goToHome() {
		vm.moveScreenState(to: .menu)
	}

}

#Preview {
	EndingView()
}
