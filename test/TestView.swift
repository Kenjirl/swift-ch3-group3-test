//
//  TestView.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 22/05/26.
//

import SwiftUI
import Lottie

struct TestView: View {
	let story: StoryModel = TestData.stories[0]
	@State private var phase: AnimationPhase = .idle

	enum AnimationPhase {
		case idle, forward, reverse
	}
	
	@AppStorage("score") var score: Int = 0
	
	@AppStorage("currentSceneIndex") var currentSceneIndex: Int = 0
	@AppStorage("currentDialogIndex") var currentDialogIndex: Int = 0
	@State private var showActions: Bool = false
	@State private var sceneHistory: [Int] = []
		
	var currentScene: SceneModel {
		story.scenes[currentSceneIndex]
	}
	
	var currentDialog: DialogModel {
		currentScene.dialogs[currentDialogIndex]
	}
	
	var isFirstDialog: Bool {
		sceneHistory.isEmpty && currentSceneIndex == 0 && currentDialogIndex == 0
	}
	
	var isLastDialog: Bool {
		currentDialogIndex == currentScene.dialogs.count - 1 && currentScene.actions == nil
	}
	
	var playerCharacter: String? {
		for scene in story.scenes {
			if let dialog = scene.dialogs.first(where: { $0.type == .player }) {
				return dialog.character
			}
		}
		return nil
	}
	
	var body: some View {
		ZStack {
			// Background
			Image(.male)
				.position(x: 120, y: 200)
			Image(.female)
				.position(x: 580, y: 200)
			//table and food
			HStack {
				LottieView{
					try await DotLottieFile.named("sparkles 3")
				}	.playbackMode(playbackMode)
						.animationDidFinish { completed in
							guard completed else { return }  // ignore incomplete callbacks
							switch phase {
							case .forward:
								DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
									phase = .reverse  // small delay helps Lottie register the state change
								}
							case .reverse:
								phase = .idle
							case .idle:
								break
							}
						}
						.onTapGesture {
							guard phase == .idle else { return }
							phase = .forward
						}
//				LottieView{
//					try await DotLottieFile.named("sparkles")
//				}
//				.playing() // Set playback behavior
//								.resizable() // Allows the animation to scale
//								.frame(width: 250)
//				Image(.lunch1)
//					.padding(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 0))
				Spacer()
				Image(.lunch2)
					.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 130))
			}
			.background(Color(.desk))
			.frame(height: 100)
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
			
			// Content
			ZStack {
				// Actions / Dialogs
				if showActions, let actions = currentScene.actions {
					HStack(spacing: 8) {
						ForEach(actions) { action in
							Button {
								sceneHistory.append(currentSceneIndex)
								let nextIndex = action.nextScene - 1
								currentSceneIndex = nextIndex
								currentDialogIndex = 0
								showActions = false
							} label: {
								Text(action.text)
									.padding(10)
									.foregroundStyle(Color.white)
							}
							.padding(10)
							.multilineTextAlignment(.center)
							.background(
								RoundedRectangle(cornerRadius: 30)
									.fill(Color(.accentPink))
							)
						}
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
					.padding(10)
				} else {
					ZStack{
						Image(.textBox)
							.resizable()
							.scaledToFit()
							.frame(width: 230)
						Text(currentDialog.text)
							.foregroundStyle(Color.white)
							.frame(width: 230)
							.offset(x: 10)
					}
					.offset(x: -50, y: -50)
				}
				
				
				//VStack(spacing: 0) {
					// Character
//					HStack {
//						if showActions {
//							if let character = playerCharacter {
//								Image(character)
//									.resizable()
//									.scaledToFill()
//									.frame(width: 80, height: 100)
//									.offset(y: 40)
//									.clipped()
//									.frame(maxWidth: .infinity, alignment: .leading)
//							}
//						} else if currentDialog.type != .narrator {
//							Image(currentDialog.character ?? "")
//								.resizable()
//								.scaledToFill()
//								.frame(width: 80, height: 100)
//								.offset(y: 40)
//								.clipped()
//								.frame(maxWidth: .infinity, alignment: currentDialog.type == .player ? .leading : .trailing)
//						}
//					}
//					.frame(maxWidth: .infinity, maxHeight: 100)
				//}
				//				.frame(maxWidth: .infinity,  alignment: .center)
				//				.background(Color.white)
			}
			//.background(Color.white)
			
			
			
			// Navigasi
			
			HStack {
				if !isFirstDialog {
					Button {
						goToPrev()
					} label: {
						Image(.prevButton)
					}
				}
				
				Spacer()
				
				if !showActions && !isLastDialog {
					Button {
						goToNext()
					} label: {
						Image(.nextButton)
					}
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
			//.background(Color.white)
			
		}
		.background(Color(.bg1))
	}
	
	func goToNext() {
		let dialogs = currentScene.dialogs
		
		if currentDialogIndex < dialogs.count - 1 {
			currentDialogIndex += 1
		} else if currentScene.actions != nil {
			showActions = true
		}
	}
	
	func goToPrev() {
		if showActions {
			showActions = false
		} else if currentDialogIndex > 0 {
			currentDialogIndex -= 1
		} else if let previousScene = sceneHistory.last {
			sceneHistory.removeLast()
			currentSceneIndex = previousScene
			currentDialogIndex = story.scenes[previousScene].dialogs.count - 1
			if story.scenes[previousScene].actions != nil {
				showActions = true
			}
		}
	}
	
	var playbackMode: LottiePlaybackMode {
		switch phase {
		case .idle:    return .paused(at: .progress(0))
		case .forward: return .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
		case .reverse: return .playing(.fromProgress(1, toProgress: 0, loopMode: .playOnce))
		}
	}
}



#Preview {
	TestView()
}
